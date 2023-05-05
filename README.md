# LogComp-APS
A linguagem além de ter loop, condições, funções e variáveis, pode ser usada para jogar minigames como batalha naval.

## EBNF da Linguagem:

```
PROGRAM = STATEMENT_LIST ;
STATEMENT_LIST = {STATEMENT}, STATEMENT_LIST;

FUNCTION_DECLARATION = "funcao", IDENTIFIER, "(", PARAMETER_LIST, ")", BLOCK ;
FUNCTION_CALL = "chama", IDENTIFIER, "(", [PARAMETER_LIST], ")" ;
BLOCK = "{", {STATEMENT}, "}" ;
STATEMENT = ( λ | ASSIGNMENT | PRINT | IF | WHILE | SHOOT | POSITION | FUNCTION_CALL | FUNCTION_DECLARATION), "\n" ;
ASSIGNMENT = IDENTIFIER, "=", EXPRESSION ;
PRINT = "mostra", "(", EXPRESSION, ")" ;
IF = "caso", "(", CONDITION, ")", BLOCK, [ "seNao", BLOCK ] ;
WHILE = "enquanto", "(", CONDITION, ")", BLOCK ;
EXPRESSION = CONDITION, { ("||" | "&&"), CONDITION } ;
CONDITION = TERM, { ("<" | ">" | "==" | "!"), TERM } ;
TERM = FACTOR, { ("*" | "/"), FACTOR } ;
FACTOR = (("+" | "-"), FACTOR) | NUMBER | "(", EXPRESSION, ")" | IDENTIFIER ;
IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;
STRING = '"', { LETTER | DIGIT | " " | "_" }, '"' ;
NUMBER = DIGIT, { DIGIT } ;
LETTER = ( a | ... | z | A | ... | Z ) ;
DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;

SHOOT = "atirar", COORDINATE ;
POSITION = "posicao", IDENTIFIER, ":", COORDINATE;
COORDINATE = LETTER, DIGIT ;

```

## Exemplo de uso da linguagem:

```python
posicao Inimigo1 : B5
posicao Inimigo2 : a5
vida_inimigo = 3
vida_inimigo2 = 3

atirar B5
caso (B5 == Inimigo1) {
    vida_inimigo = vida_inimigo -1
    mostra("Acertou")
} seNao {
    mostra("Errou")
}

posicao Inimigo1 : B4

enquanto (vida_inimigo2 > 0) {
    atirar a5
    vida_inimigo2 = vida_inimigo2 - 1
  }
mostra(vida_inimigo, vida_inimigo2)

funcao esconder (Inimigo1, Inimigo2) {
    posicao Inimigo1 : Z100
    posicao Inimigo2 : Z200
}

chama esconder(Inimigo1, Inimigo2)
```

## Usando o Flex para os tokens:
    
```bash
cd FlexBison
flex -l tokens.l
gcc -o flex lex.yy.c -lfl
./flex < exemplo.txt
```

## Usando o Bison para o parser:
```bash
cd FlexBison
bison -dv parser.y
gcc -o programa parser.tab.c lex.yy.c -lfl
./programa < exemplo.txt
```

