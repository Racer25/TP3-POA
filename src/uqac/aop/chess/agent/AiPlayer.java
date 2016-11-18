package uqac.aop.chess.agent;

import java.util.Random;
import uqac.aop.chess.Board;

public class AiPlayer extends Player {
	// dies roooooll
	private Random Dies = new Random(0);

	public AiPlayer(int arg, Board board) {
		setColor(arg);
		this.playGround = board;
	}

	@Override
	public Move makeMove() {
		Move mv;
		int iniX = -1, iniY = -1, finX = -1, finY = -1;

		iniX = Dies.nextInt(8);
		iniY = Dies.nextInt(8);
		finX = Dies.nextInt(8);
		finY = Dies.nextInt(8);
		mv = new Move(iniX, iniY, finX, finY);

		try {
			playGround.movePiece(mv);
		} catch (RuntimeException e) {
			makeMove();
		}

		System.out.println("Votre coup? <" + mv.toString() + ">");
		return mv;
	}
}
