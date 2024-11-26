import TokenTable.TokenTable;
import java_cup.runtime.Symbol;
import scanner.tokens.TokenType;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


public class Main {
    public static void main(String[] args)  {

        TokenTable validTokens = new TokenTable();
        TokenTable errors = new TokenTable();
        String path;
        try{
            path = args[0];
            System.out.println(path.endsWith(".c"));
            if(!(path.endsWith(".c") || path.endsWith(".txt"))) {
                System.out.println("Please provide a .c or .txt file path");
                return;
            }
            FileReader reader = new FileReader(path);
            FileReader parseReader = new FileReader(path);
            CScanner scanner = new CScanner(reader);

//            CParser parser = new CParser(new CScanner(parseReader));


            Symbol token;
            TokenType type;
            int line;
            while((token = scanner.next_token()).sym != sym.EOF) {
                line = scanner.getLine();
                String text = scanner.yytext();
                if(token.sym < 0) {

                     type = switch (token.sym) {
                        case -1 -> TokenType.IDENTIFIER;
                        case -2 -> TokenType.OPERATOR;
                        case -3 -> TokenType.KEYWORD;
                        case -4 -> TokenType.LITERAL;
                        default -> TokenType.UNKNOWN;
                    };

                    errors.addTokenRecord(token.sym, scanner.yytext(), type.name(), line);
                }
                else{
                    int tokenValue = token.sym;
                    if(tokenValue < 47){
                        type = TokenType.OPERATOR;
                    }
                    else if(tokenValue == 47){
                        type = TokenType.IDENTIFIER;
                    }
                    else if(tokenValue <= 80 ){
                        type = TokenType.KEYWORD;
                    }
                    else{
                        type = TokenType.LITERAL;
                    }

                    validTokens.addTokenRecord(tokenValue, text, type.name(), line);
                }
            }
//            System.out.println("Valid Tokens: ======================================");
            errors.printTable();

//            Object result = parser.parse();

//            System.out.println("Errors: ======================================");
//            errors.printTable();
        }
        catch (ArrayIndexOutOfBoundsException e){
            System.out.println("Please provide a file path");
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
           e.printStackTrace();
        }

    }
}
