%option noyywrap nounput noinput batch

%{
    // Include the common interface
    #include "common.hpp"

    // Include the parser's function definitions
    #include "parser.hpp"
%}



DIGIT [0-9]

INTEGER {DIGIT}+

LETTER [a-zA-Z_]
LETTERDIGIT [a-zA-Z0-9_]
IDENTIFIER {LETTER}{LETTERDIGIT}*

%x COMMENT

%%

[[:space:]] 


"//".+ /* Ignore single line comment */
"/*"            { BEGIN(COMMENT); }
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>\n   { }
<COMMENT>.    { }

class return yy::parser::make_CLASS_KEYWORD();

public return yy::parser::make_PUBLIC_KEYWORD();
 protected return yy::parser::make_PROTECTED_KEYWORD();
 private return yy::parser::make_PRIVATE_KEYWORD();

final return yy::parser::make_FINAL_KEYWORD();
static return yy::parser::make_STATIC_KEYWORD();


if return yy::parser::make_IF_KEYWORD();
for return yy::parser::make_FOR_KEYWORD();
while return yy::parser::make_WHILE_KEYWORD();
return return yy::parser::make_RETURN_KEYWORD();

"{" return yy::parser::make_OPEN_BRACKET();
"}" return yy::parser::make_CLOSE_BRACKET();
"(" return yy::parser::make_OPEN_PARENS();
")" return yy::parser::make_CLOSE_PARENS();
";" return yy::parser::make_SEMICOLON();
"+" return yy::parser::make_PLUS();
"-" return yy::parser::make_MINUS();
"=" return yy::parser::make_EQUALS();
"==" return yy::parser::make_EQUALS_EQUALS();
"<" return yy::parser::make_LESS_THAN();
">" return yy::parser::make_GREATER_THAN();
"++" return yy::parser::make_PLUS_PLUS();
"%" return yy::parser::make_MODULO();
"." return yy::parser::make_DOT();
"," return yy::parser::make_COMMA();
"[" return yy::parser::make_OPEN_SQUARE_BRACKET();
"]" return yy::parser::make_CLOSE_SQUARE_BRACKET();



{INTEGER} return yy::parser::make_NUMBER(std::stoi(yytext));

\".*\" return yy::parser::make_STRING(yytext);

{IDENTIFIER} return yy::parser::make_IDENTIFIER(yytext);


<<EOF>> return yy::parser::make_YYEOF();

%%
