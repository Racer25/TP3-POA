package uqac.aop.chess.aspect;

import java.util.logging.Logger;

import uqac.aop.chess.agent.Move;
import uqac.aop.chess.Board;

public aspect LogMove
{
	pointcut publicMove():call(public void Board.movePiece(Move));
	
	after() : publicMove()
	{
		Logger logger = Logger.getLogger("LogMove");
		System.out.println(thisJoinPoint.getArgs()[0].toString());
		
		logger.info(thisJoinPoint.getArgs()[0].toString());
	}
	
}
