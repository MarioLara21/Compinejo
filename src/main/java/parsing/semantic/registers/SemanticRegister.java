package parsing.semantic.registers;

public class SemanticRegister {
    public static String generateArithmeticCode(String operator, String operand1, String operand2) {
        StringBuilder assemblyCode = new StringBuilder();

        // Dependiendo del operador, genera las instrucciones adecuadas
        switch (operator) {
            case "+":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("ADD ").append(operand2).append("\n");
                break;
            case "-":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("SUB ").append(operand2).append("\n");
                break;
            case "*":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("MUL ").append(operand2).append("\n");
                break;
            case "/":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("DIV ").append(operand2).append("\n");
                break;
            case "%":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("MOD ").append(operand2).append("\n");
                break;
            case "+=":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("ADD ").append(operand2).append("\n");
                assemblyCode.append("STORE ").append(operand1).append("\n");
                break;
            case "-=":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("SUB ").append(operand2).append("\n");
                assemblyCode.append("STORE ").append(operand1).append("\n");
                break;
            case "*=":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("MUL ").append(operand2).append("\n");
                assemblyCode.append("STORE ").append(operand1).append("\n");
                break;
            case "/=":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("DIV ").append(operand2).append("\n");
                assemblyCode.append("STORE ").append(operand1).append("\n");
                break;
            case "%=":
                assemblyCode.append("LOAD ").append(operand1).append("\n");
                assemblyCode.append("MOD ").append(operand2).append("\n");
                assemblyCode.append("STORE ").append(operand1).append("\n");
                break;
            default:
                throw new IllegalArgumentException("Unsupported operator: " + operator);
        }
        return assemblyCode.toString();
    }
}
