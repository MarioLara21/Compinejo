package helpers;

public class Help {
    
    public static Object parseType(String type, String expression) {
    // check if it expression is a variable or a number
    switch (type) {
        case "int":
            try {
                return Integer.parseInt(expression);
            } catch (NumberFormatException e) {
                System.err.println("Error: Expected an integer, but got " + expression);
                return null;
            }
        case "char":
            if (expression.length() != 1) {
                System.err.println("Error: Expected a character, but got " + expression);
                return null;
            }
            return expression.charAt(0);
        case "long":
            try {
                return Long.parseLong(expression);
            } catch (NumberFormatException e) {
                System.err.println("Error: Expected a long, but got " + expression);
                return null;
            }
        case "short":
            try {
                return Short.parseShort(expression);
            } catch (NumberFormatException e) {
                System.err.println("Error: Expected a short, but got " + expression);
                return null;
            }
        default:
            System.err.println("Error: Unsupported type " + type);
            return null;
    }
}

    public static boolean isNumber(String id){
        // check if the id is a number
        try {
            Double.parseDouble(id);
        } catch (NumberFormatException e) {
            return false;
        }
        return true;
    }
}
