package expression;

public class Multiplication extends Expression {
	public final Expression left;
	public final Expression right;
	
	public Multiplication(Expression left, Expression right) {
		this.left = left;
		this.right = right;
	}
	
	public String toString() {
		return left.toString() + " * " + right.toString();
	}
}