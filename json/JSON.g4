grammar JSON;

json: object | array;
object: '{' pair (',' pair)* '}' | '{''}';
array: '['value (',' value)*']' | '['']';
pair: STRING ':' value;
value: STRING|NUMBER|object|array|'true'|'false'|'null';

STRING: '"'(ESC|~["\\])*'"';
NUMBER
    : '-'?INT'.'INT EXP?
    | '-'?INT EXP
    | '-'?INT;
WS: [ \t\r\n]+ -> skip;

fragment ESC: '\\'(["\\/bfnrt]|UNICODE);
fragment UNICODE: 'u' HEX HEX HEX HEX;
fragment HEX: [0-9a-fA-F];
fragment INT: '0'|[1-9][0-9]*;
fragment EXP: [Ee][+\-]?INT;

