grammar Expr;

@header {
	package antlr;
	import org.antlr.v4.runtime.*;
	import java.io.*;
	import java.util.*;
	//model classes
	import expression.*;
}

@members {
	public Program program;
}

/* start symbol */
prog returns [Program p]
@init{
	$p = new expression.Program();
	program = $p;
}
	: (d=decl {
		$p.addExpression($d.d);
	} 
		| 
	   e=expr {
		   $p.addExpression($e.e);
	   })+ EOF
	;

decl returns [Expression d]
	: name=ID ':' type=INT_TYPE '=' val=NUM {
		String id = $name.text;
		String type = $type.getText();
		int val = $val.int;
		$d = new expression.VariableDeclaration(id, type, val);
	}
	;

expr returns [Expression e]
	: left=expr '*' right=expr {
		$e = new expression.Multiplication($left.e, $right.e);
	}
	| left=expr '+' right=expr {
		$e = new expression.Addition($left.e, $right.e);
	}
	| id=ID {
		$e = new expression.Variable($id.text);
	}
	| n=NUM {
		$e = new expression.Number($n.int);
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
INT_TYPE : 'INT';
COMMENT : '--' ~[\r\n]* -> skip;
WS : [ \t\n\r]+ -> skip;