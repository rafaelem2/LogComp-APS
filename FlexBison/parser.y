%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  extern int yylex();
  void yyerror(const char *s) { printf("ERROR: %s\n", s); }
%}

%token IDENTIFIER STRING INTEGER COORDINATE
%token WHILE IF ELSE PRINT SHOOT POSITION FUNCTION_DECLARATION FUNCTION_CALL
%token EQUAL NOT PLUS MINUS MULT DIV AND OR
%token EQUAL_TO GT LT
%token LPAREN RPAREN LKEY RKEY
%token COMMA COLON

%start program

%%

program : statement_list 
        ;

block : LKEY statement_list RKEY
      | LKEY RKEY
      ;
        
statement_list : statement
               | statement_list statement
               ;
        
statement : POSITION IDENTIFIER COLON relexpression
          | IDENTIFIER EQUAL relexpression
          | PRINT LPAREN print_list RPAREN
          | IF LPAREN relexpression RPAREN block
          | IF LPAREN relexpression RPAREN block ELSE block
          | WHILE LPAREN relexpression RPAREN block 
          | FUNCTION_DECLARATION IDENTIFIER LPAREN parameter_list RPAREN block
          | FUNCTION_CALL IDENTIFIER LPAREN parameter_list RPAREN
          | SHOOT relexpression
          ;

parameter_list : IDENTIFIER
               | parameter_list COMMA IDENTIFIER
               ;

print_list : relexpression
           | print_list COMMA relexpression
           ;

relexpression: expression EQUAL_TO expression
             | expression GT expression
             | expression LT expression
             | expression
             ;

expression: term PLUS term
          | term MINUS term
          | term OR term
          | term
          ;
          
term: factor
    | term MULT factor
    | term DIV factor
    | term AND factor
    ;

factor: INTEGER 
    | STRING 
    | COORDINATE
    | IDENTIFIER 
    | PLUS factor
    | MINUS factor
    | NOT factor
    | LPAREN relexpression RPAREN
    ;


%%

int main(){
  yyparse();
  return 0;
}
