package expression;

public class Number extends Expression {
	public final int num;
	
	public Number(int num) {
		this.num = num;
	}
	
	public String toString() {
		return new Integer(num).toString();
	}
}