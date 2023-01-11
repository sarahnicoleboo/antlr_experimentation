package expression;

public class Variable extends Expression {
	public final String id;
	
	public Variable(String id) {
		this.id = id;
	}
	
	public String toString() {
		return id;
	}
}