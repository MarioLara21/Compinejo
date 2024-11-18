
import java_cup.runtime.Symbol;
import scanner.errors.err;
import scanner.errors.errors;
import TokenTable.TokenInfo;
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
  public int getCol() {return yycolumn+1; }
%}
%%


"auto"       { return new Symbol(sym.AUTO, getLine(), getCol(), yytext()); }
"break"      { return new Symbol(sym.BREAK, getLine(), getCol(), yytext()); }
"case"       { return new Symbol(sym.CASE, getLine(), getCol(), yytext()); }
"char"       { return new Symbol(sym.CHAR, getLine(), getCol(), yytext()); }
"const"      { return new Symbol(sym.CONST, getLine(), getCol(), yytext()); }
"continue"   { return new Symbol(sym.CONTINUE, getLine(), getCol(), yytext()); }
"default"    { return new Symbol(sym.DEFAULT, getLine(), getCol(), yytext()); }
"do"         { return new Symbol(sym.DO, getLine(), getCol(), yytext()); }
"double"     { return new Symbol(sym.DOUBLE, getLine(), getCol(), yytext()); }
"else"       { return new Symbol(sym.ELSE, getLine(), getCol(), yytext()); }
"enum"       { return new Symbol(sym.ENUM, getLine(), getCol(), yytext()); }
"extern"     { return new Symbol(sym.EXTERN, getLine(), getCol(), yytext()); }
"float"      { return new Symbol(sym.FLOAT, getLine(), getCol(), yytext()); }
"for"        { return new Symbol(sym.FOR, getLine(), getCol(), yytext()); }
"goto"       { return new Symbol(sym.GOTO, getLine(), getCol(), yytext()); }
"if"         { return new Symbol(sym.IF, getLine(), getCol(), yytext()); }
"int"        { return new Symbol(sym.INT, getLine(), getCol(), yytext()); }
"long"       { return new Symbol(sym.LONG, getLine(), getCol(), yytext()); }
"register"   { return new Symbol(sym.REGISTER, getLine(), getCol(), yytext()); }
"return"     { return new Symbol(sym.RETURN, getLine(), getCol(), yytext()); }
"short"      { return new Symbol(sym.SHORT, getLine(), getCol(), yytext()); }
"signed"     { return new Symbol(sym.SIGNED, getLine(), getCol(), yytext()); }
"sizeof"     { return new Symbol(sym.SIZEOF, getLine(), getCol(), yytext()); }
"static"     { return new Symbol(sym.STATIC, getLine(), getCol(), yytext()); }
"struct"     { return new Symbol(sym.STRUCT, getLine(), getCol(), yytext()); }
"switch"     { return new Symbol(sym.SWITCH, getLine(), getCol(), yytext()); }
"typedef"    { return new Symbol(sym.TYPEDEF, getLine(), getCol(), yytext()); }
"union"      { return new Symbol(sym.UNION, getLine(), getCol(), yytext()); }
"unsigned"   { return new Symbol(sym.UNSIGNED, getLine(), getCol(), yytext()); }
"void"       { return new Symbol(sym.VOID, getLine(), getCol(), yytext()); }
"volatile"   { return new Symbol(sym.VOLATILE, getLine(), getCol(), yytext()); }
"while"      { return new Symbol(sym.WHILE, getLine(), getCol(), yytext()); }
"read"       {return new Symbol(sym.READ, getLine(), getCol(), yytext()); }
"write"      {return new Symbol(sym.WRITE, getLine(), getCol(), yytext()); }

/* Operators */
","         { return new Symbol(sym.COMMA, getLine(), getCol(), yytext()); }
";"         { return new Symbol(sym.SEMICOLON, getLine(), getCol(), yytext()); }
"++"        { return new Symbol(sym.INCREMENT, getLine(), getCol(), yytext()); }
"--"        { return new Symbol(sym.DECREMENT, getLine(), getCol(), yytext()); }
"=="        { return new Symbol(sym.EQUALS, getLine(), getCol(), yytext()); }
">="        { return new Symbol(sym.GREATEREQUAL, getLine(), getCol(), yytext()); }
">"         { return new Symbol(sym.GREATER, getLine(), getCol(), yytext()); }
"?"         { return new Symbol(sym.QUESTION, getLine(), getCol(), yytext()); }
"<="        { return new Symbol(sym.LESSEQUAL, getLine(), getCol(), yytext()); }
"<"         { return new Symbol(sym.LESS, getLine(), getCol(), yytext()); }
"!="        { return new Symbol(sym.NOTEQUAL, getLine(), getCol(), yytext()); }
"||"        { return new Symbol(sym.OROR, getLine(), getCol(), yytext()); }
"&&"        { return new Symbol(sym.ANDAND, getLine(), getCol(), yytext()); }
"!"         { return new Symbol(sym.NOT, getLine(), getCol(), yytext()); }
"="         { return new Symbol(sym.ASSIGN, getLine(), getCol(), yytext()); }
"+"         { return new Symbol(sym.PLUS, getLine(), getCol(), yytext()); }
"-"         { return new Symbol(sym.MINUS, getLine(), getCol(), yytext()); }
"*"         { return new Symbol(sym.TIMES, getLine(), getCol(), yytext()); }
"/"         { return new Symbol(sym.DIVIDE, getLine(), getCol(), yytext()); }
"%"         { return new Symbol(sym.MODULO, getLine(), getCol(), yytext()); }
"("         { return new Symbol(sym.LPAREN, getLine(), getCol(), yytext()); }
")"         { return new Symbol(sym.RPAREN, getLine(), getCol(), yytext()); }
"["         { return new Symbol(sym.LBRACKET, getLine(), getCol(), yytext()); }
"]"         { return new Symbol(sym.RBRACKET, getLine(), getCol(), yytext()); }
"{"         { return new Symbol(sym.LBRACE, getLine(), getCol(), yytext()); }
"}"         { return new Symbol(sym.RBRACE, getLine(), getCol(), yytext()); }
":"         { return new Symbol(sym.COLON, getLine(), getCol(), yytext()); }
"."         { return new Symbol(sym.DOT, getLine(), getCol(), yytext()); }
"+="        { return new Symbol(sym.PLUSEQUAL, getLine(), getCol(), yytext()); }
"-="        { return new Symbol(sym.MINUSEQUAL, getLine(), getCol(), yytext()); }
"*="        { return new Symbol(sym.TIMESEQUAL, getLine(), getCol(), yytext()); }
"/="        { return new Symbol(sym.DIVIDEEQUAL, getLine(), getCol(), yytext()); }
"&"         { return new Symbol(sym.AND, getLine(), getCol(), yytext()); }
"^"         { return new Symbol(sym.XOR, getLine(), getCol(), yytext()); }
"|"         { return new Symbol(sym.OR, getLine(), getCol(), yytext()); }
">>"        { return new Symbol(sym.RSHIFT, getLine(), getCol(), yytext()); }
"<<"        { return new Symbol(sym.LSHIFT, getLine(), getCol(), yytext()); }
"~"         { return new Symbol(sym.TILDE, getLine(), getCol(), yytext()); }
"%="        { return new Symbol(sym.MODULOEQUAL, getLine(), getCol(), yytext()); }
"&="        { return new Symbol(sym.ANDEQUAL, getLine(), getCol(), yytext()); }
"^="        { return new Symbol(sym.XOREQUAL, getLine(), getCol(), yytext()); }
"|="        { return new Symbol(sym.OREQUAL, getLine(), getCol(), yytext()); }
"<<="       { return new Symbol(sym.LSHIFTEQUAL, getLine(), getCol(), yytext()); }
">>="       { return new Symbol(sym.RSHIFTEQUAL, getLine(), getCol(), yytext()); }
"->"        { return new Symbol(sym.ARROW, getLine(), getCol(), yytext()); }
"#"         { return new Symbol(sym.HASH, getLine(), getCol(), yytext()); }


/*Identifiers*/
[a-zA-Z][a-zA-Z0-9]* { return new Symbol(sym.ID, getLine(), getCol(), yytext()); }

/* Numbers */
[0-9]+ { return new Symbol(sym.NUM, getLine(), getCol(), yytext()); } // Decimal integer
[0][0-7]+ { return new Symbol(sym.NUM, getLine(), getCol(), yytext()); } // Octal
[0][xX][0-9a-fA-F]+ { return new Symbol(sym.NUM, getLine(), getCol(), yytext()); } // Hexadecimal
[0-9]+\.[0-9]+([eE][+-]?[0-9]+)? { return new Symbol(sym.NUM, getLine(), getCol(), yytext()); } // Decimal with fractional or exponential part
[0-9]+([eE][+-]?[0-9]+)? { return new Symbol(sym.NUM, getLine(), getCol(), yytext()); } // Scientific notation
//[-+]?[0-9]+ {return new Symbol(sym.NUM, Integer.parseInt(yytext())); } // Entero con signo opcional


/*Strings & Characters*/

\"[^\"\\]*(\\.[^\"\\]*)*\"    {
          String str = yytext();
          if(str.contains("\n")){
              return new Symbol(err.errorMap.get(errors.UnexpectedLiteral));
          }
          return new Symbol(sym.STRING, getLine(), getCol(), yytext()); }
\'([^\']{1})\'                { return new Symbol(sym.STRING, getLine(), getCol(), yytext()); }  // Carácter entre comillas dobles
#[0-9]+                     { return new Symbol(sym.STRING, getLine(), getCol(), yytext()); }  // Carácter representado como # seguido de un número entero


/* Comments */
"//"[^\n]*      { /* Ignore single-line comments */ }
"/*"([^*]|[\r\n]|"*"[^/])*"*/" { /* Handle comment here */ }


/* Whitespace */
[ \t\n\r] { /* ignore whitespace */ }


/* Error handling */
.               {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), getLine(), getCol(), yytext()); }
    // Identifier errors
([a-zA-Z0-9áéíóúÁÉÍÓÚñÑ@\$%]+)   { return new Symbol(err.errorMap.get(errors.InvalidIdentifier), getLine(), getCol(), yytext()); }
[0-9]+[a-zA-Z]+ {return new Symbol(err.errorMap.get(errors.InvalidIdentifier), getLine(), getCol(), yytext()); }

    // String errors

\.[0-9]+ {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), getLine(), getCol(), yytext()); } // Número decimal sin dígito antes del punto
[0-9]+\.[^0-9] {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), getLine(), getCol(), yytext()); } // Número decimal sin dígito después del punto
(("\.")([eE][-+]?[0-9]+)) {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), getLine(), getCol(), yytext()); } //Numeros cientificos que no tienen nada antes del punto decimal
[0-9]*\.[0-9]+[eE][+-]?[0-9]* {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), getLine(), getCol(), yytext()); } //Parte científica incompleta
\.[0-9]+[eE][+-]?[0-9]+ {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), getLine(), getCol(), yytext()); } //Parte científica mal estructurada
<<EOF>> {
  return new Symbol(sym.EOF, getLine(), getCol(), yytext());
}

