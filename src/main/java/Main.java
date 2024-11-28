import TokenTable.TokenTable;
import java_cup.runtime.Symbol;
import parsing.semantic.SemanticErrorManager;
import parsing.semantic.SemanticStack;
import parsing.semantic.SemanticSymbol;
import parsing.semantic.SymbolTable;
import parsing.semantic.registers.SemanticRegister;
import scanner.tokens.TokenType;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        TokenTable validTokens = new TokenTable();
        TokenTable errors = new TokenTable();
        SymbolTable symbolTable = new SymbolTable();
        SemanticErrorManager semanticErrorManager = new SemanticErrorManager();
        SemanticStack semanticStack = new SemanticStack();
        SemanticRegister semanticRegister = new SemanticRegister();
        String path;

        try {
            // Verificar que se proporcione una ruta de archivo
            if (args.length == 0) {
                System.out.println("Please provide a file path");
                return;
            }

            path = args[0];
            if (!(path.endsWith(".c") || path.endsWith(".txt"))) {
                System.out.println("Please provide a .c or .txt file path");
                return;
            }

            FileReader reader = new FileReader(path);
            FileReader parseReader = new FileReader(path);
            CScanner scanner = new CScanner(reader);
            CParser parser = new CParser(new CScanner(parseReader));

            Symbol token;
            TokenType type = null;
            int line;

            // Análisis léxico
            while ((token = scanner.next_token()).sym != sym.EOF) {
                line = scanner.getLine();
                String text = scanner.yytext();

                if (token.sym < 0) {
                    // Si es un error léxico
                    type = switch (token.sym) {
                        case -1 -> TokenType.IDENTIFIER;
                        case -2 -> TokenType.OPERATOR;
                        case -3 -> TokenType.KEYWORD;
                        case -4 -> TokenType.LITERAL;
                        default -> TokenType.UNKNOWN;
                    };
                    errors.addTokenRecord(token.sym, text, type.name(), line);
                    semanticErrorManager.addSemanticError("Invalid token: " + text + " at line " + line);
                } else {
                    // Si es un token válido
                    int tokenValue = token.sym;
                    if (tokenValue < 47) {
                        type = TokenType.OPERATOR;
                    } else if (tokenValue == 47) {
                        type = TokenType.IDENTIFIER;
                    } else if (tokenValue <= 80) {
                        type = TokenType.KEYWORD;
                    } else {
                        type = TokenType.LITERAL;
                    }
                    validTokens.addTokenRecord(tokenValue, text, type.name(), line);

                    // Registrar identificadores en la tabla de símbolos
                    if (type == TokenType.IDENTIFIER) {
                        SemanticSymbol symbol = new SemanticSymbol(text, "unknown", false, null, 0);
                        if (!symbolTable.contains(text)) {
                            symbolTable.addSymbol(symbol);
                        }
                    }
                }
            }

            // Imprimir tokens válidos y errores léxicos
            System.out.println("Valid Tokens: ======================================");
            validTokens.printTable();
            System.out.println("Errors: ======================================");
            errors.printTable();

            // Análisis sintáctico y semántico
            Object result = parser.parse();
            System.out.println("Parsing completed.");

            // Imprimir errores semánticos
            if (semanticErrorManager.hasErrors()) {
                System.out.println("Semantic Errors: ======================================");
                semanticErrorManager.printErrors();
            } else {
                System.out.println("No semantic errors detected.");
            }

        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Please provide a file path");
        } catch (IOException e) {
            System.out.println("File not found or unable to read the file");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Método para generar el archivo de código ensamblador
    public void generateAssemblyFile(String fileName) {
        StringBuilder assemblyCode = new StringBuilder();
        for (SemanticSymbol symbol : SymbolTable.getAllSymbols()) {
            if (symbol.getType().equals("int")) {
                assemblyCode.append(symbol.getName()).append(": DW 0\n");
            }
        }
        String operand1 = "op1"; // Temporal, para evitar error de compilación
        String operand2 = "op2"; // Temporal, para evitar error de compilación
        String arithmeticCode = SemanticRegister.generateArithmeticCode("+", operand1, operand2);
        assemblyCode.append(arithmeticCode);
        try (FileWriter writer = new FileWriter(fileName)) {
            writer.write(assemblyCode.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
