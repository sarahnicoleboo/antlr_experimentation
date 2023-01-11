package expression;

public class VariableDeclaration extends Expression {
	public final String id;
	public final String type;
	public final int value;
	
	public VariableDeclaration(String id, String type, int value) {
		this.id = id;
		this.type = type;
		this.value = value;
	}
}