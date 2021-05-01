package calc;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;

public class Calc {
    public static void main(String[] args) throws Exception {
        String inputFile = null;
        if (args.length > 0) inputFile = args[0];
        InputStream is = System.in;
        if (inputFile != null) is = new FileInputStream(inputFile);
        CharStream input = CharStreams.fromStream(is);
        LabeledExprLexer lexer = new LabeledExprLexer(input); // Use labeledExprLexer
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        LabeledExprParser parser = new LabeledExprParser(tokens);
        ParseTree tree = parser.prog(); // parse

        /*
         Create visitor and visit parse tree to calculate parsed value
         */
        EvalVisitor eval = new EvalVisitor();
        eval.visit(tree);
    }
}
