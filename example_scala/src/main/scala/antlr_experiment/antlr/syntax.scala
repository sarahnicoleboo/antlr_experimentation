package antlr_experiment.antlr

import scala.collection.mutable.Buffer
//ast sturucture

//types
sealed trait Type
case object IntType extends Type

//variable
case class Variable(name: String)

//ops
sealed trait Binop
case object PlusOp extends Binop
case object MultiplicationOp extends Binop

//exps
sealed trait Exp
case class IntegerLiteralExp(value: Int) extends Exp
case class VariableExp(name: Variable) extends Exp
case class BinopExp(left: Exp, op: Binop, right: Exp) extends Exp
case class VariableDeclarationExp(name: Variable, theType: Type, exp: Int) extends Exp
//case class VariableDeclarationExp(name: Variable, theType: Type, exp: Exp) extends Exp

//program
case class Program(exps: Seq[Exp])

class ProgramBuilder {
	val buffer: Buffer[Exp] = Buffer()
	def addExp(exp: Exp): Unit = {
		buffer += exp
	}
	def toProgram(): Program = Program(buffer.toSeq)
}
