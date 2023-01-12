package expression;

import java.util.List;
import java.util.ArrayList;

public class Program {
	public final List<Expression> expressions;
	
	public Program() {
		this.expressions = new ArrayList<>();
	}
	
	public void addExpression(Expression e) {
		expressions.add(e);
	}
	

	//hashCode, equals, and toString
}