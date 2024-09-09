import ErrorTable.ErrorTable;
import java_cup.runtime.Symbol;
import scanner.symbols.sym;
import scanner.tokens.TokenType;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args)  {

        ErrorTable errors = new ErrorTable();
        String path;
        try{
            path = args[0];
            System.out.println(path.endsWith(".c"));
            if(!(path.endsWith(".c") || path.endsWith(".txt"))) {
                System.out.println("Please provide a .c or .txt file path");
                return;
            }
            FileReader reader = new FileReader(path);
            CScanner scanner = new CScanner(reader);

            ArrayList<Symbol> validTokens = new ArrayList<>();

            Symbol token;
            int line;
            while((token = scanner.next_token()).sym != sym.EOF) {
                line = scanner.getLine();
                String text = scanner.yytext();
                if(token.sym < 0) {

                    TokenType type = switch (token.sym) {
                        case -1 -> TokenType.IDENTIFIER;
                        case -2 -> TokenType.OPERATOR;
                        case -3 -> TokenType.KEYWORD;
                        case -4 -> TokenType.LITERAL;
                        default -> TokenType.UNKNOWN;
                    };

                    errors.addErrorRecord(token.sym, scanner.yytext(), type.name(), line);
                    continue;
                }
                validTokens.add(token);
            }

            errors.printErrorTable();
        }
        catch (ArrayIndexOutOfBoundsException e){
            System.out.println("Please provide a file path");
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
