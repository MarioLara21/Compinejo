
import java_cup.runtime.Symbol;
%%

%class CScanner
%unicode
%cup
%public
%type Symbol
%line
%column

%%

/*Keywords*/
//MARIO TRABAJO

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

/*Identifiers*/
[a-zA-Z][a-zA-Z0-9]* { return new Symbol(sym.ID, yytext()); }

/*Numbers*/
[0-9]+ { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }

/* Comments */
"//"[^\n]*      { /* Ignore single-line comments */ }
"/*"[^*]*"*"[^/]("*"|"[^/"])*"/"  { /* Ignore multi-line comments */ }

/* Whitespace */
[ \t\n\r] { /* ignore whitespace */ }

/* Error handling */
.               { System.err.println("Unexpected character: " + yytext()); }
    // Identifier error
[0-9]+[a-zA-Z]+ { System.err.println("Invalid identifier: " + yytext()); }