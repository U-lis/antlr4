grammar Cymbol;

file: (varDecl|funcDecl)+;

varDecl: type ID ('=' expr)?';';
type: 'int' | 'float' | 'void';

funcDecl: type ID '('params?')' block;
params: param (',' param)*;
param: type ID;

block: '{' stat* '}';
stat
    : block
    | varDecl
    | 'if' expr 'then' stat ('else' stat)?
    | 'return' expr? ';'
    | expr '=' expr ';'
    | expr ';';

expr
    : ID '('exprList?')'
    | expr '['expr']'
    | '-'expr
    | '!'expr
    | expr '*' expr
    | expr ('+'|'-') expr
    | expr '==' expr
    | ID
    | INT
    | '('expr')'
    ;
exprList: expr (',' expr)*;

ID: STRING (STRING|INT)*;
fragment STRING: [a-zA-Z];
INT: [0-9]+;
WS: [ \t\r\n] -> skip;
SINGLE_COMMENT: '//' .*? '\n' -> skip;