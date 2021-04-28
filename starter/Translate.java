import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Translate {
    public static void main(String[] args) throws Exception {
        // Create stream reads from stdin
        CharStream input = CharStreams.fromStream(System.in);

        // Create lexer
        ArrayInitLexer lexer = new ArrayInitLexer(input);

        // Create token stream
        CommonTokenStream tokens = new CommonTokenStream(lexer);

        // Create parser
        ArrayInitParser parser = new ArrayInitParser(tokens);

        ParseTree tree = parser.init();

        // Create generic parse tree walker to trigger callbacks
        ParseTreeWalker walker = new ParseTreeWalker();
        // Walking through tree and trigger callbacks
        walker.walk(new ShortToUnicodeString(), tree);
        System.out.println();
    }
}
