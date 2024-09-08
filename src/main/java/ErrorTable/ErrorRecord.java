package ErrorTable;

import java.util.HashMap;

public class ErrorRecord {
    private final int errorId;
    private final String token;
    private final String tokenType;
    private final HashMap<Integer, Integer> lineOccurrence;


    public ErrorRecord(int errorId, String token, String tokenType, int line) {
        this.errorId = errorId;
        this.token = token;
        this.tokenType = tokenType;

        this.lineOccurrence = new HashMap<>();
        this.lineOccurrence.put(line, 1);

    }

    public void addNewOccurrence(int line){
        if(this.lineOccurrence.containsKey(line)){
            this.lineOccurrence.put(line, this.lineOccurrence.get(line) + 1);
        } else {
            this.lineOccurrence.put(line, 1);
        }
    };

    public int getErrorId() {
        return errorId;
    }

    public String getToken() {
        return token;
    }

    public String getTokenType() {
        return tokenType;
    }

    public HashMap<Integer, Integer> getLineOccurrence() {
        return lineOccurrence;
    }

    public String getLineOccurrenceString() {
        StringBuilder lineOccurrenceString = new StringBuilder();
        for (int line : lineOccurrence.keySet()) {
            lineOccurrenceString.append(line).append(" (").append(lineOccurrence.get(line)).append("), ");
        }
        return lineOccurrenceString.toString();
    }

    @Override
    public String toString() {
        StringBuilder errorRecordString = new StringBuilder();
        errorRecordString.append("Error ID: ").append(errorId).append("\t");
        errorRecordString.append("Token: ").append(token).append("\t");
        errorRecordString.append("Token Type: ").append(tokenType).append("\t");
        for(int line : lineOccurrence.keySet()){
            errorRecordString.append(line).append(" (").append(lineOccurrence.get(line)).append("), ");
        }
        return errorRecordString.toString();
    }
}
