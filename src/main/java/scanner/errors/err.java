package scanner.errors;

import static java.util.Map.entry;
import static scanner.errors.errors.*;

import java.util.HashMap;
import java.util.Map;

public class err {

    public static Map<errors, Integer> errorMap = Map.ofEntries(
            entry(InvalidIdentifier, -1),
            entry(InvalidOperator, -2),
            entry(InvalidReservedWord, -3),
            entry(UnexpectedLiteral, -4),
            entry(InvalidCharacter, -5),
            entry(InvalidNumber, -6)

    );
}
