
import java_cup.runtime.Symbol;
import scanner.errors.err;
import scanner.errors.errors;
import scanner.symbols.sym;
%%

%class CScanner
%unicode
%cup
%public
%type Symbol
%line
%column

%{
  public int getLine() { return yyline+1; }
%}
L=[a-zA-Z_]+
D=[0-9]+
O=0[0-7]+
H=0[xX][0-9a-fA-F]+
F=[0-9]+\.[0-9]*([eE][-+]?[0-9]+)?
E= [0-9]+([eE][-+]?[0-9]+)
S=[-+]?[0-9]+
espacio=[ ,\t,\r]+

%%

/*Keywords*/
"auto" { return new Symbol(sym.AUTO); }
"break" { return new Symbol(sym.BREAK); }
"case" { return new Symbol(sym.CASE); }
"char" { return new Symbol(sym.CHAR); }
"const" { return new Symbol(sym.CONST); }
"continue" { return new Symbol(sym.CONTINUE); }
"default" { return new Symbol(sym.DEFAULT); }
"do" { return new Symbol(sym.DO); }
"double" { return new Symbol(sym.DOUBLE); }
"else" { return new Symbol(sym.ELSE); }
"enum" { return new Symbol(sym.ENUM); }
"extern" { return new Symbol(sym.EXTERN); }
"float" { return new Symbol(sym.FLOAT); }
"for" { return new Symbol(sym.FOR); }
"goto" { return new Symbol(sym.GOTO); }
"if" { return new Symbol(sym.IF); }
"int" { return new Symbol(sym.INT); }
"long" { return new Symbol(sym.LONG); }
"register" { return new Symbol(sym.REGISTER); }
"return" { return new Symbol(sym.RETURN); }
"short" { return new Symbol(sym.SHORT); }
"signed" { return new Symbol(sym.SIGNED); }
"sizeof" { return new Symbol(sym.SIZEOF); }
"static" { return new Symbol(sym.STATIC); }
"struct" { return new Symbol(sym.STRUCT); }
"switch" { return new Symbol(sym.SWITCH); }
"typedef" { return new Symbol(sym.TYPEDEF); }
"union" { return new Symbol(sym.UNION); }
"unsigned" { return new Symbol(sym.UNSIGNED); }
"void" { return new Symbol(sym.VOID); }
"volatile" { return new Symbol(sym.VOLATILE); }
"while" { return new Symbol(sym.WHILE); }

/*Operators*/
","         { return new Symbol(sym.COMMA); }
";"         { return new Symbol(sym.SEMICOLON); }
"++"        { return new Symbol(sym.INCREMENT); }
"--"        { return new Symbol(sym.DECREMENT); }
"=="        { return new Symbol(sym.EQUALS); }
">="        { return new Symbol(sym.GREATEREQUAL); }
">"         { return new Symbol(sym.GREATER); }
"?"         { return new Symbol(sym.QUESTION); }
"<="        { return new Symbol(sym.LESSEQUAL); }
"<"         { return new Symbol(sym.LESS); }
"!="        { return new Symbol(sym.NOTEQUAL); }
"||"        { return new Symbol(sym.OROR); }
"&&"        { return new Symbol(sym.ANDAND); }
"!"         { return new Symbol(sym.NOT); }
"="         { return new Symbol(sym.ASSIGN); }
"+"         { return new Symbol(sym.PLUS); }
"-"         { return new Symbol(sym.MINUS); }
"*"         { return new Symbol(sym.TIMES); }
"/"         { return new Symbol(sym.DIVIDE); }
"%"         { return new Symbol(sym.MODULO); }
"("         { return new Symbol(sym.LPAREN); }
")"         { return new Symbol(sym.RPAREN); }
"["         { return new Symbol(sym.LBRACKET); }
"]"         { return new Symbol(sym.RBRACKET); }
"{"         { return new Symbol(sym.LBRACE); }
"}"         { return new Symbol(sym.RBRACE); }
":"         { return new Symbol(sym.COLON); }
"."         { return new Symbol(sym.DOT); }
"+="        { return new Symbol(sym.PLUSEQUAL); }
"-="        { return new Symbol(sym.MINUSEQUAL); }
"*="        { return new Symbol(sym.TIMESEQUAL); }
"/="        { return new Symbol(sym.DIVIDEEQUAL); }
"&"         { return new Symbol(sym.AND); }
"^"         { return new Symbol(sym.XOR); }
"|"         { return new Symbol(sym.OR); }
">>"        { return new Symbol(sym.RSHIFT); }
"<<"        { return new Symbol(sym.LSHIFT); }
"~"         { return new Symbol(sym.TILDE); }
"%="        { return new Symbol(sym.MODULOEQUAL); }
"&="        { return new Symbol(sym.ANDEQUAL); }
"^="        { return new Symbol(sym.XOREQUAL); }
"|="        { return new Symbol(sym.OREQUAL); }
"<<="       { return new Symbol(sym.LSHIFTEQUAL); }
">>="       { return new Symbol(sym.RSHIFTEQUAL); }
"->"        { return new Symbol(sym.ARROW); }
"#"         { return new Symbol(sym.HASH); }

/*Identifiers*/
[a-zA-Z][a-zA-Z0-9]* { return new Symbol(sym.ID, yytext()); }

/* Números */
[0-9]+ {return new Symbol(sym.NUM, Integer.parseInt(yytext())); } // Decimal entero
[0][0-7]+ {return new Symbol(sym.NUM, Integer.parseInt(yytext(), 8)); } // Octal
[0][xX][0-9a-fA-F]+ {return new Symbol(sym.NUM, Integer.parseInt(yytext().substring(2), 16)); } // Hexadecimal
[0-9]+\.[0-9]*([eE][-+]?[0-9]+)? {return new Symbol(sym.NUM, Double.parseDouble(yytext())); } // Decimal con parte fraccionaria o exponencial
[0-9]+([eE][-+]?[0-9]+) {return new Symbol(sym.NUM, Double.parseDouble(yytext())); } // Decimal con notación científica
[-+]?[0-9]+ {return new Symbol(sym.NUM, Integer.parseInt(yytext())); } // Entero con signo opcional


/*Strings & Characters*/

\"([^\"\\n]*)\"               { return new Symbol(sym.STRING, yytext()); }  // String entre comillas dobles sin saltos de línea
\'([^\']{1})\'                { return new Symbol(sym.STRING, yytext()); }  // Carácter entre comillas dobles
"#"[0-9]+                     { return new Symbol(sym.STRING, yytext()); }  // Carácter representado como # seguido de un número entero


/* Comments */
"//"[^\n]*      { /* Ignore single-line comments */ }
"/*"([^*]|[\r\n]|"*"[^/])*"*/" { /* Handle comment here */ }


/* Whitespace */
[ \t\n\r] { /* ignore whitespace */ }

/* Error handling */
.               {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral));}
([a-zA-Z0-9áéíóúÁÉÍÓÚñÑ@\$%\&\*\+\-\=]+)   { return new Symbol(err.errorMap.get(errors.InvalidIdentifier)); }
[0-9]+[a-zA-Z]+ {return new Symbol(err.errorMap.get(errors.InvalidIdentifier));}
\.[0-9]+ {return new Symbol(err.errorMap.get(errors.InvalidNumber));} // Número decimal sin dígito antes del punto
[0-9]+\.[^0-9] {return new Symbol(err.errorMap.get(errors.InvalidNumber));} // Número decimal sin dígito después del punto

(("\"")({L}+)(" " |{L})*) {return new Symbol(err.errorMap.get(errors.InvalidString));} //strings que no cierran al inicio
(({L}+)((" " |{L}+)*) ("\"")) {return new Symbol(err.errorMap.get(errors.InvalidString));} // strings que no cierran al final
(("\.")([eE][-+]?[0-9]+)) {return new Symbol(err.errorMap.get(errors.InvalidNumber));} //Numeros cientificos que no tienen nada antes del punto decimal
(([1-9][0-9]*|0)("\.")([eE][-+]?)) {return new Symbol(err.errorMap.get(errors.InvalidNumber));} //Parte científica incompleta
(([1-9][0-9]*|0)("\.")(D)([eE][-+]?)) {return new Symbol(err.errorMap.get(errors.InvalidNumber));} //Parte científica mal estructurada