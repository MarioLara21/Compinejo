package TokenTable;

import java.util.List;

public class TokenTable {
    private final List<TokenRecord> tokenRecords;

    public TokenTable() {
        this.tokenRecords = new java.util.ArrayList<>();
    }


    public void addTokenRecord(int errorId, String token, String tokenType, int line) {
        TokenRecord newRecord = new TokenRecord(
            errorId,
            token,
            tokenType,
            line
        );
        for (TokenRecord record : this.tokenRecords) {
            if (record.getErrorId() == newRecord.getErrorId()
                && record.getToken().equals(newRecord.getToken())
            ) {
                record.addNewOccurrence(line);
                return;
            }
        }
        tokenRecords.add(newRecord);
    }

    public void printTable() {
        for (TokenRecord record : this.tokenRecords) {
            System.out.println(record.toString());
        }
    }
}
