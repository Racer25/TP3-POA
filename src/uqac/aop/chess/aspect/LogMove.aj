package uqac.aop.chess.aspect;

import java.util.logging.Logger;

import uqac.aop.chess.agent.HumanPlayer;
import uqac.aop.chess.agent.Move;
import uqac.aop.chess.agent.Player;
import uqac.aop.chess.Board;

public aspect LogMove {
	pointcut publicMove():call(public boolean Board.movePiece(Move));

	after() returning(boolean isValid): publicMove()
	{
		Player p = (Player) thisJoinPoint.getThis();
		Logger logger = Logger.getLogger("LogMove");
		String mvStr = thisJoinPoint.getArgs()[0].toString();

		if (isValid) {
			System.out.println(mvStr);
			logger.info(mvStr);
		} else {
			if (p instanceof HumanPlayer)
				logger.warning("Movement non autorisé du joueur : " + mvStr);
		}
	}

}
