package parsing.semantic;

import java.util.ArrayList;
import java.util.List;

public class SemanticErrorManager {
    private List<String> errors = new ArrayList<>();

    public SemanticErrorManager() {
        this.errors = new ArrayList<>();
    }
    public void addLexicalError(String message) {
        errors.add("Lexical Error: " + message);
    }

    public void addSyntacticError(String message) {
        errors.add("Syntactic Error: " + message);
    }

    public void addSemanticError(String message) {
        errors.add("Semantic Error: " + message);
    }

    public void printErrors() {
        for (String error : errors) {
            System.err.println(error);
        }
    }

    public boolean hasErrors() {
        return !errors.isEmpty();
    }

}
