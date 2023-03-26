# LogComp-APS
A linguagem além de ter loop, condições, funções e variáveis, pode ser usada para jogar minigames como batalha naval.

## EBNF da Linguagem:

```
FUNCTION_DECLARATION = "funcao", IDENTIFIER, "(", [ PARAMETER_LIST ], ")", BLOCK ;
PARAMETER_LIST = [ (IDENTIFIER | COORDINATE | NUMBER), { ",", (IDENTIFIER | COORDINATE | NUMBER) } ] ;
FUNCTION_CALL = IDENTIFIER, "(", [ ARGUMENT_LIST ], ")" ;
ARGUMENT_LIST = EXPRESSION, { ",", EXPRESSION } ;

BLOCK = "{", { STATEMENT }, "}" ;
STATEMENT = ( λ | ASSIGNMENT | PRINT | IF | WHILE | SHOOT | MOVE | FUNCTION_CALL ), "\n" ;
ASSIGNMENT = IDENTIFIER, "=", EXPRESSION ;
PRINT = "mostra", "(", EXPRESSION, ")" ;
IF = "se", "(", CONDITION, ")", BLOCK, [ "seNao", BLOCK ] ;
WHILE = "enquanto", "(", CONDITION, ")", BLOCK ;
EXPRESSION = TERM, { ("+" | "-"), TERM } ;
TERM = FACTOR, { ("*" | "/"), FACTOR } ;
FACTOR = (("+" | "-"), FACTOR) | NUMBER | "(", EXPRESSION, ")" | IDENTIFIER ;
CONDITION = EXPRESSION, COMPARISON, EXPRESSION ;
COMPARISON = "==" | "!=" | "<=" | ">=" | "<" | ">" ;
IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;
NUMBER = DIGIT, { DIGIT } ;
LETTER = ( a | ... | z | A | ... | Z ) ;
DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;

SHOOT = "atirar", "em", COORDINATE ;
MOVE = "mover", "para", COORDINATE ;
COORDINATE = LETTER, DIGIT ;

```

## Exemplo de uso da linguagem:

```python
Inimigo1 = B5
Inimigo2 = a5
vida_inimigo = 3
vida_inimigo2 = 3

atirar em B5
se (B5 = Inimigo) {
    vida_inimigo = vida_inimigo -1
    mostra("Acertou!")
} seNao {
    mostra("Errou!")
}
enquanto (vida_inimigo2 > 0) {
    atirar em a5
    vida_inimigo2 = vida_inimigo2 - 1
  }
mostra(vida_inimigo1, vida_inimigo2)
```