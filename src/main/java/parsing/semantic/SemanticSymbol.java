package parsing.semantic;

public class SemanticSymbol {
    private String name;        // Name of the symbol (identifier)
    private String type;        // Type of the symbol (e.g., "int", "float")
    private boolean isConstant; // True if the symbol is a constant
    private Object value;       // Current value of the symbol (optional, for constants or initialized variables)
    private int scopeLevel;     // Scope level of the symbol (optional, useful for nested scopes)

    // Constructor
    public SemanticSymbol(String name, String type, boolean isConstant, Object value, int scopeLevel) {
        this.name = name;
        this.type = type;
        this.isConstant = isConstant;
        this.value = value;
        this.scopeLevel = scopeLevel;
    }

    // Getters and Setters
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isConst() {
        return isConstant;
    }

    public void setConstant(boolean constant) {
        isConstant = constant;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public int getScopeLevel() {
        return scopeLevel;
    }

    public void setScopeLevel(int scopeLevel) {
        this.scopeLevel = scopeLevel;
    }

    // Override toString for better debugging
    @Override
    public String toString() {
        return "Symbol{" +
                "name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", isConstant=" + isConstant +
                ", value=" + value +
                ", scopeLevel=" + scopeLevel +
                '}';
    }
}