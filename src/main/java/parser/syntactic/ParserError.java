package parser.syntactic;

import java_cup.runtime.Symbol;

public class ParserError {

    public static void reportError(String message, Symbol sym) {
        int line = sym.left;
        int column = sym.right;
        System.err.println("Syntax Error at line " + line + ", column " + column + ": " + message);
    }

}
