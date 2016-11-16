package uqac.aop.chess.aspect;

import uqac.aop.chess.Board;
import uqac.aop.chess.agent.*;

public aspect MoveValidate {

	pointcut publicMove():call(public void Board.movePiece(Move));

	before() : publicMove()
	{
		Move mv = (Move) thisJoinPoint.getArgs()[0];

		if (mv == null)
			throw new RuntimeException("Illegal Movement");
		if (!((Board) thisJoinPoint.getTarget()).getGrid()[mv.xI][mv.yI].isOccupied())
			throw new RuntimeException("Illegal Movement");
		if (((Board) thisJoinPoint.getTarget()).getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == ((Player) thisJoinPoint.getThis()).getColor())
			throw new RuntimeException("Illegal Movement");
		if (!((Board) thisJoinPoint.getTarget()).getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv))
			throw new RuntimeException("Illegal Movement");
	}
}
