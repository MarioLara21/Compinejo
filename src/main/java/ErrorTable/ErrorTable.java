package ErrorTable;

import java.util.List;

public class ErrorTable {
    private final List<ErrorRecord> errorRecords;

    public ErrorTable() {
        this.errorRecords = new java.util.ArrayList<>();
    }


    public void addErrorRecord(int errorId, String token,String tokenType, int line) {
        ErrorRecord newRecord = new ErrorRecord(
            errorId,
            token,
            tokenType,
            line
        );
        for (ErrorRecord record : this.errorRecords) {
            if (record.getErrorId() == newRecord.getErrorId()
                && record.getToken().equals(newRecord.getToken())
            ) {
                record.addNewOccurrence(line);
                return;
            }
        }
        errorRecords.add(newRecord);
    }

    public void printErrorTable() {
        for (ErrorRecord record : this.errorRecords) {
            System.out.println(record.toString());
        }
    }
}
