package parsing.semantic;
import java.util.Stack;

public class SemanticStack {
    private Stack<SemanticSymbol> stack;

    public SemanticStack() {
        stack = new Stack<>();
    }

    public void push(SemanticSymbol symbol) {
        stack.push(symbol);
    }

    public SemanticSymbol pop() {
        return stack.pop();
    }

    public SemanticSymbol peek() {
        return stack.peek();
    }

    public boolean isEmpty() {
        return stack.isEmpty();
    }
}
