package uqac.aop.chess.aspect;

import uqac.aop.chess.agent.*;

public aspect MoveValidate {
	
pointcut publicMove():call(public void HumanPlayer.makeMove(Move));
	
	before() : publicMove()
	{
		Move mv= (Move)thisJoinPoint.getArgs()[0];
		if(mv == null)
		{
			
		}
			
	}
}
