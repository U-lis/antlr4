grammar Rows;

@parser::members {  // Add members to generated RowsParser
    int col;
    public RowsParser(TokenStream input, int col) {  // Custom Constructor
        this(input);
        this.col = col;
    }
}

file: (row NL)+;

row
locals [int i=0]
    : (STUFF
        {
            $i++;
            if ($i == col) System.out.println($STUFF.text);
        }
    )+
    ;

TAB: '\t' -> skip;
NL: '\r'?'\n';
STUFF: ~[\t\r\n]+;
