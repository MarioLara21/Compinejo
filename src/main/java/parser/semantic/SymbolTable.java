package parser.semantic;

import java.util.*;

class SymbolTable {
    private final Map<String, SemanticSymbol> table;

    public SymbolTable() {
        this.table = new HashMap<>();
    }

    // Add a SemanticSymbol to the table
    public void addSymbol(SemanticSymbol SemanticSymbol) {
        if (table.containsKey(SemanticSymbol.getName())) {
            throw new IllegalArgumentException("SemanticSymbol already exists: " + SemanticSymbol.getName());
        }
        table.put(SemanticSymbol.getName(), SemanticSymbol);
    }

    // Lookup a SemanticSymbol by name
    public SemanticSymbol lookup(String name) {
        return table.get(name);
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
    public Collection<SemanticSymbol> getAllSymbols() {
        return table.values();
    }

    @Override
    public String toString() {
        return table.values().toString();
    }
}
