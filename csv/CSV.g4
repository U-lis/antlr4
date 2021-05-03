grammar CSV;

file: header row+;
header: row;
row: field (',' field)* NL;
field: TEXT
    |STRING
    |
    ;

TEXT: ~[,\n\r"]+;
STRING: '"' ('""'|~'"')* '"';
NL: '\r'?'\n';
