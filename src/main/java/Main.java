import java_cup.runtime.Symbol;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args)  {
        try{
            FileReader reader = new FileReader("src/main/resources/test.c");
            CScanner scanner = new CScanner(reader);

            Symbol token;
            while((token = scanner.next_token()).sym != sym.EOF) {
                System.out.println(token);
            }
        }
        catch (FileNotFoundException e) {
            System.out.println("File not found");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
