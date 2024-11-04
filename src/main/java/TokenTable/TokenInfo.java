package TokenTable;

public class TokenInfo {
    public String value;
    public int line;
    public int column;

    public TokenInfo(String value, int line, int column) {
        this.value = value;
        this.line = line;
        this.column = column;
    }
}
