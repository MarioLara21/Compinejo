
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
"int" { return new Symbol(Sym.INT); }
"return" { return new Symbol(Sym.RETURN); }
"if" { return new Symbol(Sym.IF); }
"else" { return new Symbol(Sym.ELSE); }

/*Operators*/
"+" { return new Symbol(Sym.PLUS); }
"-" { return new Symbol(Sym.MINUS); }
"*" { return new Symbol(Sym.MULT); }
"/" { return new Symbol(Sym.DIV); }
"=" { return new Symbol(Sym.ASSIGN); }
"==" { return new Symbol(Sym.EQUAL); }
"!=" { return new Symbol(Sym.NOTEQUAL); }
"<" { return new Symbol(Sym.LESS); }
"<=" { return new Symbol(Sym.LESSEQUAL); }
">" { return new Symbol(Sym.GREATER); }
">=" { return new Symbol(Sym.GREATEREQUAL); }
"&&" { return new Symbol(Sym.AND); }
"||" { return new Symbol(Sym.OR); }
"!" { return new Symbol(Sym.NOT); }
"(" { return new Symbol(Sym.LPAREN); }
")" { return new Symbol(Sym.RPAREN); }
"{" { return new Symbol(Sym.LBRACE); }
"}" { return new Symbol(Sym.RBRACE); }
";" { return new Symbol(Sym.SEMICOLON); }
"[" { return new Symbol(Sym.LBRACKET); }
"]" { return new Symbol(Sym.RBRACKET); }

/*Identifiers*/
[a-zA-Z][a-zA-Z0-9]* { return new Symbol(Sym.ID, yytext()); }

/*Numbers*/
[0-9]+ { return new Symbol(Sym.NUM, Integer.parseInt(yytext())); }

/* Comments */
"//"[^\n]*      { /* Ignore single-line comments */ }
"/*"[^*]*"*"[^/]("*"|"[^/"])*"/"  { /* Ignore multi-line comments */ }

/* Whitespace */
[ \t\n\r] { /* ignore whitespace */ }

/* Error handling */
.               { System.err.println("Unexpected character: " + yytext()); }