package uqac.aop.chess;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

import uqac.aop.chess.agent.AiPlayer;
import uqac.aop.chess.agent.HumanPlayer;
import uqac.aop.chess.agent.Player;

public class Chess
{

	protected Board board;

	public Chess()
	{

		board = new Board();
		board.setupChessBoard();

	}

	public Board getBoard()
	{
		return board;
	}

	public void setBoard(Board board)
	{
		this.board = board;
	}

	private void play()
	{
		Player hp = new HumanPlayer(Player.BLACK, board);
		Player ap = new AiPlayer(Player.WHITE, board);

		while (true)
		{
			board.print();
			hp.makeMove();
			board.print();
			ap.makeMove();
		}
	}

	public static void main(String[] args)
	{
		Logger logger = Logger.getLogger("LogMove");
		logger.setUseParentHandlers(false);
		FileHandler fh;

		try
		{
			// This block configure the logger with handler and formatter
			fh = new FileHandler("LogMove.log");
			logger.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);

			// the following statement is used to log any messages
			logger.info("Nouvelle partie: ");

		} 
		catch (SecurityException e)
		{
			e.printStackTrace();
		} 
		catch (IOException e)
		{
			e.printStackTrace();
		}

		new Chess().play();
	}
}
