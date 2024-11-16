package parser.semantic;

import java.util.List;
import java.util.ArrayList;

public class SemanticSymbol {
    private final String name;
    private final String type;
    private final String scope;
    private final String storageClass;
    private final int address;
    private final int size;
    private final boolean isInitialized;
    private final int lineNumber;

    // Function-specific fields
    private String returnType;
    private List<SemanticSymbol> parameters;

    // Constructor for general symbols
    public SemanticSymbol(String name, String type, String scope, String storageClass,
                          int address, int size, boolean isInitialized, int lineNumber) {
        this.name = name;
        this.type = type;
        this.scope = scope;
        this.storageClass = storageClass;
        this.address = address;
        this.size = size;
        this.isInitialized = isInitialized;
        this.lineNumber = lineNumber;
        this.parameters = new ArrayList<>(); // Default empty parameter list
    }

    // Constructor for function symbols
    public SemanticSymbol(String name, String type, String scope, String storageClass,
                          int address, int size, boolean isInitialized, int lineNumber,
                          String returnType, List<SemanticSymbol> parameters) {
        this(name, type, scope, storageClass, address, size, isInitialized, lineNumber);
        this.returnType = returnType;
        this.parameters = parameters;
    }

    // Getters and setters for all fields
    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getScope() {
        return scope;
    }

    public String getStorageClass() {
        return storageClass;
    }

    public int getAddress() {
        return address;
    }

    public int getSize() {
        return size;
    }

    public boolean isInitialized() {
        return isInitialized;
    }

    public int getLineNumber() {
        return lineNumber;
    }

    public String getReturnType() {
        return returnType;
    }

    public List<SemanticSymbol> getParameters() {
        return parameters;
    }

    @Override
    public String toString() {
        return String.format("Symbol{name='%s', type='%s', scope='%s', storageClass='%s', " +
                        "address=%d, size=%d, isInitialized=%b, lineNumber=%d, returnType='%s', parameters=%s}",
                name, type, scope, storageClass, address, size, isInitialized, lineNumber,
                returnType, parameters);
    }
}
