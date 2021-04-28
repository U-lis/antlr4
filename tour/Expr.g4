/*
grammar is made of rule sets. rules have expression rule and symbol rule.
lowercase rule is parser rule
UPPERCASE rule is lexer rule
alternative rule uses |
make subrule using parenthesis to symbols
*/

grammar Expr;

// start rule; begin parsing from here
prog: stat+;

stat: expr NEWLINE | ID '=' expr NEWLINE | NEWLINE;

expr: expr ('*'|'/') expr | expr ('+'|'-') expr | INT | ID | '('expr')';

ID: [a-zA-Z]+;
INT: [0-9]+;
NEWLINE: '\r'?'\n'; // return newlines to parser (end-statement signal)
WS: [ \t]+ -> skip;