grammar LibExpr;

import CommonLexerRules;  // this imports all rules from CommonLexerRules

prog: stat+;
stat: expr NEWLINE | ID '=' expr NEWLINE | NEWLINE;
expr: expr ('*'|'/') expr | expr ('+'|'-') expr | INT | ID | '(' expr ')';