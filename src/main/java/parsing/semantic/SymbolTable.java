package parsing.semantic;

import java.util.*;

public class SymbolTable {
    private static Map<String, SemanticSymbol> table;

    public SymbolTable() {
        this.table = new HashMap<>();
    }

    // Add a SemanticSymbol to the table
    public void addSymbol(SemanticSymbol newSym) {
        SemanticSymbol testSym = table.get(newSym.getName());

        if (testSym != null && testSym.getName().equals(newSym.getName())) {
            System.err.println("Symbol Table Error: symbol " +newSym.getName()+" already exists");
        }
        table.put(newSym.getName(), newSym);
    }

    // Lookup a SemanticSymbol by name
    public SemanticSymbol getSymbol(String name) {
        return table.get(name);
    }

    public boolean validateNumberSymbolUpdate(String id){
        SemanticSymbol queriedSym = this.table.get(id);
        if (queriedSym.isConst()) {
            System.err.println("Semantic error: Variable " + id + " is constant");
            return false;
        }
        else if (!queriedSym.getType().equals("int") && !queriedSym.getType().equals("long") && !queriedSym.getType().equals("short")) {
            System.err.println("Semantic error: Variable " + id + " is not an integer");
            return false;
        }
        else if(queriedSym.getValue() == null){
            System.err.println("Semantic error: Variable " + id + " is not initialized");
            return false;
        }
        return true;
    }

    // Remove a SemanticSymbol by name
    public boolean removeSymbol(String name) {
        return table.remove(name) != null;
    }

    // Check if a SemanticSymbol exists
    public boolean contains(String name) {
        return table.containsKey(name);
    }

    // Get all symbols in the table
    public static Collection<SemanticSymbol> getAllSymbols() {
        return table.values();
    }

    public void printTable() {
        StringBuilder sb = new StringBuilder();
        for (SemanticSymbol sym : table.values()) {
            sb.append(sym.toString()).append("\n");
        }
        System.out.println(sb.toString());
    }

    public boolean isDefined(String name) {
        return table.containsKey(name);
    }
}
