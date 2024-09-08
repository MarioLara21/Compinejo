import ErrorTable.ErrorTable;
import java_cup.runtime.Symbol;
import scanner.symbols.sym;
import scanner.tokens.TokenType;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args)  {

        ErrorTable errors = new ErrorTable();

        try{
            FileReader reader = new FileReader("src/main/resources/test.c");
            CScanner scanner = new CScanner(reader);

            Symbol token;
            int line;
            while((token = scanner.next_token()).sym != sym.EOF) {
                line = scanner.getLine();
                if(token.sym < 0) {

                    TokenType type = switch (token.sym) {
                        case -1 -> TokenType.IDENTIFIER;
                        case -2 -> TokenType.OPERATOR;
                        case -3 -> TokenType.KEYWORD;
                        case -4 -> TokenType.LITERAL;
                        default -> TokenType.UNKNOWN;
                    };

                    errors.addErrorRecord(token.sym, scanner.yytext(), type.name(), line);
                }
            }

            errors.printErrorTable();
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
