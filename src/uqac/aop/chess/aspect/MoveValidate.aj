package uqac.aop.chess.aspect;

import java.util.logging.Logger;

import uqac.aop.chess.Board;
import uqac.aop.chess.agent.*;

public aspect MoveValidate {

	pointcut publicMove(Move mv):call(public boolean Board.movePiece(Move)) && args(mv);

	boolean around(Move mv) : publicMove(mv) {
		Board b = (Board) thisJoinPoint.getTarget();
		Player p = (Player) thisJoinPoint.getThis();

		boolean moveError = (mv == null) || !b.getGrid()[mv.xI][mv.yI].isOccupied()
				|| b.getGrid()[mv.xI][mv.yI].getPiece().getPlayer() == p.getColor()
				|| !b.getGrid()[mv.xI][mv.yI].getPiece().isMoveLegal(mv);

		if (moveError == true) {
			if (p instanceof HumanPlayer)
				Logger.getLogger("LogMove").warning("Movement non autorisé du joueur");
			return false;
		} else {
			return proceed(mv);
		}

	}
}
