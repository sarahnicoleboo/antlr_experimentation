grammar Expr;

@header {
	package antlr_experiment.antlr;
	//import org.antlr.v4.runtime.*;
	import java.io.*;
	import java.util.*;
	
	import scala.collection.*;
	//import static scala.collection.JavaConversions.asJavaCollection;
	//model classes
}

@members {
	public ProgramBuilder program;
	//public Program(new ArrayList<>()) program;
	//List<Exp> exps = new ArrayList<Exp>();
	//public Program program;
}

/* start symbol */
prog returns [ProgramBuilder p]
@init{
	//$p = new Program();
	$p = new ProgramBuilder();
	//$p = new expression.Program();
	program = $p;
}
	: (d=decl {
		$p.addExp($d.d);
		//$p.addExpression($d.d);
	} 
		| 
	   e=expr {
		   $p.addExp($e.e);
		   //$p.addExpression($e.e);
	   })+ EOF
	;

decl returns [Exp d]
	: name=ID ':' type=TYPE '=' val=NUM {
//original:
//decl returns [Expression d]
	//: name=ID ':' type=INT_TYPE '=' val=NUM {
		String name = $name.text;
		Variable var = new Variable(name);
		String theType = $type.text;
		Type finalType = new IntType();
		/*if(theType.equals("INT")) {
			Type theFinalType = new IntType();
		} */
		//currently only ints for simplicity
		int exp = $val.int;
		Exp exp = $val.
		$d = new VariableDeclarationExp(var, finalType, exp);
		//original:
		/*String id = $name.text;
		String type = $type.getText();
		int val = $val.int;
		$d = new expression.VariableDeclaration(id, type, val); */
	}
	;

expr returns [Exp e]
//expr returns [Expression e]
	: left=expr '*' right=expr {
		$e = new BinopExp($left.e, new PlusOp(), $right.e);
		//original:
		//$e = new expression.Multiplication($left.e, $right.e);
	}
	| left=expr '+' right=expr {
		$e = new BinopExp($left.e, new MultiplicationOp(), $right.e);
		//original:
		//$e = new expression.Addition($left.e, $right.e);
	}
	| id=ID {
		$e = new VariableExp(new Variable($id.text));
		//original:
		//$e = new expression.Variable($id.text);
	}
	| n=NUM {
		$e = new IntegerLiteralExp($n.int);
		//original:
		//$e = new expression.Number($n.int);
	}
	;
	
	/*
	expr: expr '*' expr
		 | expr '+' expr
		 | ID
		 | NUM
	*/

//you're not supposed to use left recursion but for some reason antlr allows it now
//according to some people on the internet: antlr handles left recursion and orders precendence in the order that the production is written
/*
expr: term '*' expr
	| term '+' expr
	| term
	;
	
term: ID
	| NUM
	;
*/

/* Tokens */
ID : [a-z][a-zA-Z0-9_]*;	//variables
NUM : '0' | '-'?[1-9][0-9]*;
TYPE : 'INT';
//INT_TYPE : 'INT';
COMMENT : '--' ~[\r\n]* -> skip;
WS : [ \t\n\r]+ -> skip;