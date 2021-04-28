import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Test {
    public static void main(String[] args) throws Exception {
        // Create CharStream to read from stdin
        CharStream input = CharStreams.fromStream(System.in);

        // Create a lexer from CharStream
        ArrayInitLexer lexer = new ArrayInitLexer(input);

        // Create a token buffer from lexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Create a parser from token buffer
        ArrayInitParser parser = new ArrayInitParser(tokens);

        ParseTree tree = parser.init(); // Begin init rule
        System.out.println(tree.toStringTree(parser)); // Print LISP style tree
    }
}