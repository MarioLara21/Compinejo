import java.io.*;
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
"int" { return new Symbol(sym.INT); }
"return" { return new Symbol(sym.RETURN); }
"if" { return new Symbol(sym.IF); }
"else" { return new Symbol(sym.ELSE); }

/*Operators*/
"+" { return new Symbol(sym.PLUS); }
"-" { return new Symbol(sym.MINUS); }
"*" { return new Symbol(sym.MULT); }
"/" { return new Symbol(sym.DIV); }
"=" { return new Symbol(sym.ASSIGN); }
"==" { return new Symbol(sym.EQUAL); }
"!=" { return new Symbol(sym.NOTEQUAL); }
"<" { return new Symbol(sym.LESS); }
"<=" { return new Symbol(sym.LESSEQUAL); }
">" { return new Symbol(sym.GREATER); }
">=" { return new Symbol(sym.GREATEREQUAL); }
"&&" { return new Symbol(sym.AND); }
"||" { return new Symbol(sym.OR); }
"!" { return new Symbol(sym.NOT); }
"(" { return new Symbol(sym.LPAREN); }
")" { return new Symbol(sym.RPAREN); }
"{" { return new Symbol(sym.LBRACE); }
"}" { return new Symbol(sym.RBRACE); }
";" { return new Symbol(sym.SEMICOLON); }
"[" { return new Symbol(sym.LBRACKET); }
"]" { return new Symbol(sym.RBRACKET); }

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