package uqac.aop.chess.aspect;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import uqac.aop.chess.agent.Move;
import uqac.aop.chess.Board;

public aspect LogMove
{
	pointcut publicMove():call(public void Board.movePiece(Move));
	
	after() : publicMove()
	{
		System.out.println(thisJoinPoint.getArgs()[0].toString());
		File log=new File("log.txt");
		
		try
		{
			PrintWriter pw = new PrintWriter (new BufferedWriter (new FileWriter (log, true)));
			pw.println(thisJoinPoint.getArgs()[0].toString());
			pw.close();
		}
		catch(IOException e)
		{
			System.out.println ("Erreur lors de la lecture : " + e.getMessage());
		}
	}
	
}
