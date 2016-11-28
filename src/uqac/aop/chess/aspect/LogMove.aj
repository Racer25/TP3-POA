package uqac.aop.chess.aspect;

import java.util.logging.Logger;

import uqac.aop.chess.agent.Move;
import uqac.aop.chess.Board;

public aspect LogMove {
	pointcut publicMove():call(public boolean Board.movePiece(Move));

	after() returning(boolean isValid): publicMove()
	{
		if (isValid) {
			Logger logger = Logger.getLogger("LogMove");
			System.out.println(thisJoinPoint.getArgs()[0].toString());

			logger.info(thisJoinPoint.getArgs()[0].toString());
		}
	}

}
