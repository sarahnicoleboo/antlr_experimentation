package app;

//import org.antlr.v4.runtime.CharStream;
//import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import antlr.ExprParser;
import antlr.ExprLexer;
import expression.Program;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import expression.*;

public class ExpressionApp {
	
	public static void main(String[] args) {
		if(args.length != 1) {
			System.err.print("Usage: file name");
		} else {
			String fileName = args[0];
			ExprParser parser = getParser(fileName);
			
			//tell ANTLR to build a parse tree
			//parse from the start symbol 'prog'
			ParseTree antlrTree = parser.prog();
			//actually don't need to save the result of the above but leaving this for reference.
			Program prog = parser.program;
			
			
			//trying stuff out below:
			List<Expression> expressions = new ArrayList<>();
			expressions = prog.expressions;
			for (Expression e: expressions) {
				System.out.println(e.toString());
			}
		}
	}
	
	private static ExprParser getParser(String fileName) {
		ExprParser parser = null;
		
		try {
			CharStream input = CharStreams.fromFileName(fileName);
			ExprLexer lexer = new ExprLexer(input);
			CommonTokenStream tokens = new CommonTokenStream(lexer);
			parser = new ExprParser(tokens);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return parser;
	}
}