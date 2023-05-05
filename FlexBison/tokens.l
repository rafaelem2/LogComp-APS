%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"


%}


%%

[ \t\n]                 ;   
"caso"                  { printf("IF\n"); return IF; }
"enquanto"              { printf("WHILE\n"); return WHILE; }
"seNao"                 { printf("ELSE\n"); return ELSE; }
"mostra"                { printf("PRINT\n"); return PRINT; }
"atirar"                { printf("SHOOT\n"); return SHOOT; }
"posicao"               { printf("POSITION\n"); return POSITION;}
"funcao"                { printf("FUNCTION_DECLARATION\n"); return FUNCTION_DECLARATION; }
"chama"                 { printf("FUNCTION_CALL\n"); return FUNCTION_CALL; }


[a-zA-Z][0-9]+          { printf("COORDINATE\n"); return COORDINATE; }
[a-zA-Z_][_a-zA-Z0-9]*   { printf("IDENTIFIER\n"); return IDENTIFIER; }
[0-9]+                  { printf("INTEGER\n"); return INTEGER; }
\"(\\.|[^\"\n])*\"    { printf("STRING\n"); return STRING; }



"="                     { printf("EQUAL\n"); return EQUAL; }
"=="                    { printf("EQUAL_TO\n"); return EQUAL_TO; }
"!"                     { printf("NOT\n"); return NOT; }
"+"                     { printf("PLUS\n"); return PLUS; }
"-"                     { printf("MINUS\n"); return MINUS; }
"*"                     { printf("MULT\n"); return MULT; }
"/"                     { printf("DIV\n"); return DIV; }
"&&"                    { printf("AND\n"); return AND; }
"||"                    { printf("OR\n"); return OR; }
">"                     { printf("GT\n"); return GT; }
"<"                     { printf("LT\n"); return LT; }

"("                     { printf("LPAREN\n"); return LPAREN; }
")"                     { printf("RPAREN\n"); return RPAREN; }
"{"                     { printf("LKEY\n"); return LKEY; }
"}"                     { printf("RKEY\n"); return RKEY; }
":"                     { printf("COLON\n"); return COLON; }
","                     { printf("COMMA\n"); return COMMA; }

.                       printf("Unknown token!\n"); yyterminate();


%%