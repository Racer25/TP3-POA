package uqac.aop.chess.aspect;

import uqac.aop.chess.Board;
import uqac.aop.chess.agent.*;

public aspect MoveValidate {

	pointcut publicMove(Move mv):call(public boolean Board.movePiece(Move)) && args(mv);

	boolean around(Move mv) : publicMove(mv) {
		Board b = (Board) thisJoinPoint.getTarget();
		Player p = (Player) thisJoinPoint.getThis();

		boolean moveValid;

		try {
			moveValid = (mv != null);
			moveValid = moveValid && b.getGrid()[mv.xI][mv.yI].isOccupied();
			moveValid = moveValid && b.getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == p.getColor();
			moveValid = moveValid && b.getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv);
			if (moveValid && b.getGrid()[mv.xF][mv.yF].isOccupied()) {
				moveValid = moveValid && b.getGrid()[mv.xF][mv.yF].getPiece().getPlayer() != p.getColor();
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			moveValid = false;
		}

		if (moveValid == false) {
			return false;
		} else {
			return proceed(mv);
		}

	}
}
