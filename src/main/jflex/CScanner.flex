
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


"auto"       { return new Symbol(sym.AUTO, new TokenInfo(yytext(), getLine(), getCol())); }
"break"      { return new Symbol(sym.BREAK, new TokenInfo(yytext(), getLine(), getCol())); }
"case"       { return new Symbol(sym.CASE, new TokenInfo(yytext(), getLine(), getCol())); }
"char"       { return new Symbol(sym.CHAR, new TokenInfo(yytext(), getLine(), getCol())); }
"const"      { return new Symbol(sym.CONST, new TokenInfo(yytext(), getLine(), getCol())); }
"continue"   { return new Symbol(sym.CONTINUE, new TokenInfo(yytext(), getLine(), getCol())); }
"default"    { return new Symbol(sym.DEFAULT, new TokenInfo(yytext(), getLine(), getCol())); }
"do"         { return new Symbol(sym.DO, new TokenInfo(yytext(), getLine(), getCol())); }
"double"     { return new Symbol(sym.DOUBLE, new TokenInfo(yytext(), getLine(), getCol())); }
"else"       { return new Symbol(sym.ELSE, new TokenInfo(yytext(), getLine(), getCol())); }
"enum"       { return new Symbol(sym.ENUM, new TokenInfo(yytext(), getLine(), getCol())); }
"extern"     { return new Symbol(sym.EXTERN, new TokenInfo(yytext(), getLine(), getCol())); }
"float"      { return new Symbol(sym.FLOAT, new TokenInfo(yytext(), getLine(), getCol())); }
"for"        { return new Symbol(sym.FOR, new TokenInfo(yytext(), getLine(), getCol())); }
"goto"       { return new Symbol(sym.GOTO, new TokenInfo(yytext(), getLine(), getCol())); }
"if"         { return new Symbol(sym.IF, new TokenInfo(yytext(), getLine(), getCol())); }
"int"        { return new Symbol(sym.INT, new TokenInfo(yytext(), getLine(), getCol())); }
"long"       { return new Symbol(sym.LONG, new TokenInfo(yytext(), getLine(), getCol())); }
"register"   { return new Symbol(sym.REGISTER, new TokenInfo(yytext(), getLine(), getCol())); }
"return"     { return new Symbol(sym.RETURN, new TokenInfo(yytext(), getLine(), getCol())); }
"short"      { return new Symbol(sym.SHORT, new TokenInfo(yytext(), getLine(), getCol())); }
"signed"     { return new Symbol(sym.SIGNED, new TokenInfo(yytext(), getLine(), getCol())); }
"sizeof"     { return new Symbol(sym.SIZEOF, new TokenInfo(yytext(), getLine(), getCol())); }
"static"     { return new Symbol(sym.STATIC, new TokenInfo(yytext(), getLine(), getCol())); }
"struct"     { return new Symbol(sym.STRUCT, new TokenInfo(yytext(), getLine(), getCol())); }
"switch"     { return new Symbol(sym.SWITCH, new TokenInfo(yytext(), getLine(), getCol())); }
"typedef"    { return new Symbol(sym.TYPEDEF, new TokenInfo(yytext(), getLine(), getCol())); }
"union"      { return new Symbol(sym.UNION, new TokenInfo(yytext(), getLine(), getCol())); }
"unsigned"   { return new Symbol(sym.UNSIGNED, new TokenInfo(yytext(), getLine(), getCol())); }
"void"       { return new Symbol(sym.VOID, new TokenInfo(yytext(), getLine(), getCol())); }
"volatile"   { return new Symbol(sym.VOLATILE, new TokenInfo(yytext(), getLine(), getCol())); }
"while"      { return new Symbol(sym.WHILE, new TokenInfo(yytext(), getLine(), getCol())); }
"read"       {return new Symbol(sym.READ, new TokenInfo(yytext(), getLine(), getCol()));}
"write"      {return new Symbol(sym.WRITE, new TokenInfo(yytext(), getLine(), getCol()));}

/* Operators */
","         { return new Symbol(sym.COMMA, new TokenInfo(yytext(), getLine(), getCol())); }
";"         { return new Symbol(sym.SEMICOLON, new TokenInfo(yytext(), getLine(), getCol())); }
"++"        { return new Symbol(sym.INCREMENT, new TokenInfo(yytext(), getLine(), getCol())); }
"--"        { return new Symbol(sym.DECREMENT, new TokenInfo(yytext(), getLine(), getCol())); }
"=="        { return new Symbol(sym.EQUALS, new TokenInfo(yytext(), getLine(), getCol())); }
">="        { return new Symbol(sym.GREATEREQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
">"         { return new Symbol(sym.GREATER, new TokenInfo(yytext(), getLine(), getCol())); }
"?"         { return new Symbol(sym.QUESTION, new TokenInfo(yytext(), getLine(), getCol())); }
"<="        { return new Symbol(sym.LESSEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"<"         { return new Symbol(sym.LESS, new TokenInfo(yytext(), getLine(), getCol())); }
"!="        { return new Symbol(sym.NOTEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"||"        { return new Symbol(sym.OROR, new TokenInfo(yytext(), getLine(), getCol())); }
"&&"        { return new Symbol(sym.ANDAND, new TokenInfo(yytext(), getLine(), getCol())); }
"!"         { return new Symbol(sym.NOT, new TokenInfo(yytext(), getLine(), getCol())); }
"="         { return new Symbol(sym.ASSIGN, new TokenInfo(yytext(), getLine(), getCol())); }
"+"         { return new Symbol(sym.PLUS, new TokenInfo(yytext(), getLine(), getCol())); }
"-"         { return new Symbol(sym.MINUS, new TokenInfo(yytext(), getLine(), getCol())); }
"*"         { return new Symbol(sym.TIMES, new TokenInfo(yytext(), getLine(), getCol())); }
"/"         { return new Symbol(sym.DIVIDE, new TokenInfo(yytext(), getLine(), getCol())); }
"%"         { return new Symbol(sym.MODULO, new TokenInfo(yytext(), getLine(), getCol())); }
"("         { return new Symbol(sym.LPAREN, new TokenInfo(yytext(), getLine(), getCol())); }
")"         { return new Symbol(sym.RPAREN, new TokenInfo(yytext(), getLine(), getCol())); }
"["         { return new Symbol(sym.LBRACKET, new TokenInfo(yytext(), getLine(), getCol())); }
"]"         { return new Symbol(sym.RBRACKET, new TokenInfo(yytext(), getLine(), getCol())); }
"{"         { return new Symbol(sym.LBRACE, new TokenInfo(yytext(), getLine(), getCol())); }
"}"         { return new Symbol(sym.RBRACE, new TokenInfo(yytext(), getLine(), getCol())); }
":"         { return new Symbol(sym.COLON, new TokenInfo(yytext(), getLine(), getCol())); }
"."         { return new Symbol(sym.DOT, new TokenInfo(yytext(), getLine(), getCol())); }
"+="        { return new Symbol(sym.PLUSEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"-="        { return new Symbol(sym.MINUSEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"*="        { return new Symbol(sym.TIMESEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"/="        { return new Symbol(sym.DIVIDEEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"&"         { return new Symbol(sym.AND, new TokenInfo(yytext(), getLine(), getCol())); }
"^"         { return new Symbol(sym.XOR, new TokenInfo(yytext(), getLine(), getCol())); }
"|"         { return new Symbol(sym.OR, new TokenInfo(yytext(), getLine(), getCol())); }
">>"        { return new Symbol(sym.RSHIFT, new TokenInfo(yytext(), getLine(), getCol())); }
"<<"        { return new Symbol(sym.LSHIFT, new TokenInfo(yytext(), getLine(), getCol())); }
"~"         { return new Symbol(sym.TILDE, new TokenInfo(yytext(), getLine(), getCol())); }
"%="        { return new Symbol(sym.MODULOEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"&="        { return new Symbol(sym.ANDEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"^="        { return new Symbol(sym.XOREQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"|="        { return new Symbol(sym.OREQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"<<="       { return new Symbol(sym.LSHIFTEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
">>="       { return new Symbol(sym.RSHIFTEQUAL, new TokenInfo(yytext(), getLine(), getCol())); }
"->"        { return new Symbol(sym.ARROW, new TokenInfo(yytext(), getLine(), getCol())); }
"#"         { return new Symbol(sym.HASH, new TokenInfo(yytext(), getLine(), getCol())); }


/*Identifiers*/
[a-zA-Z][a-zA-Z0-9]* { return new Symbol(sym.ID, new TokenInfo(yytext(), getLine(), getCol())); }

/* Numbers */
[0-9]+ { return new Symbol(sym.NUM, new TokenInfo(yytext(), getLine(), getCol())); } // Decimal integer
[0][0-7]+ { return new Symbol(sym.NUM, new TokenInfo(yytext(), getLine(), getCol())); } // Octal
[0][xX][0-9a-fA-F]+ { return new Symbol(sym.NUM, new TokenInfo(yytext(), getLine(), getCol())); } // Hexadecimal
[0-9]+\.[0-9]+([eE][+-]?[0-9]+)? { return new Symbol(sym.NUM, new TokenInfo(yytext(), getLine(), getCol())); } // Decimal with fractional or exponential part
[0-9]+([eE][+-]?[0-9]+)? { return new Symbol(sym.NUM, new TokenInfo(yytext(), getLine(), getCol())); } // Scientific notation
//[-+]?[0-9]+ {return new Symbol(sym.NUM, Integer.parseInt(yytext())); } // Entero con signo opcional


/*Strings & Characters*/

\"[^\"\\]*(\\.[^\"\\]*)*\"    {
          String str = yytext();
          if(str.contains("\n")){
              return new Symbol(err.errorMap.get(errors.UnexpectedLiteral));
          }
          return new Symbol(sym.STRING, new TokenInfo(yytext(), getLine(), getCol())); }
\'([^\']{1})\'                { return new Symbol(sym.STRING, new TokenInfo(yytext(), getLine(), getCol())); }  // Carácter entre comillas dobles
#[0-9]+                     { return new Symbol(sym.STRING, new TokenInfo(yytext(), getLine(), getCol())); }  // Carácter representado como # seguido de un número entero


/* Comments */
"//"[^\n]*      { /* Ignore single-line comments */ }
"/*"([^*]|[\r\n]|"*"[^/])*"*/" { /* Handle comment here */ }


/* Whitespace */
[ \t\n\r] { /* ignore whitespace */ }


/* Error handling */
.               {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), new TokenInfo(yytext(), getLine(), getCol()));}
    // Identifier errors
([a-zA-Z0-9áéíóúÁÉÍÓÚñÑ@\$%]+)   { return new Symbol(err.errorMap.get(errors.InvalidIdentifier), new TokenInfo(yytext(), getLine(), getCol())); }
[0-9]+[a-zA-Z]+ {return new Symbol(err.errorMap.get(errors.InvalidIdentifier), new TokenInfo(yytext(), getLine(), getCol()));}

    // String errors

\.[0-9]+ {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), new TokenInfo(yytext(), getLine(), getCol()));} // Número decimal sin dígito antes del punto
[0-9]+\.[^0-9] {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), new TokenInfo(yytext(), getLine(), getCol()));} // Número decimal sin dígito después del punto
(("\.")([eE][-+]?[0-9]+)) {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), new TokenInfo(yytext(), getLine(), getCol()));} //Numeros cientificos que no tienen nada antes del punto decimal
[0-9]*\.[0-9]+[eE][+-]?[0-9]* {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), new TokenInfo(yytext(), getLine(), getCol()));} //Parte científica incompleta
\.[0-9]+[eE][+-]?[0-9]+ {return new Symbol(err.errorMap.get(errors.UnexpectedLiteral), new TokenInfo(yytext(), getLine(), getCol()));} //Parte científica mal estructurada
<<EOF>> {
  return new Symbol(sym.EOF, new TokenInfo("EOF",getLine(),getCol()));
}

