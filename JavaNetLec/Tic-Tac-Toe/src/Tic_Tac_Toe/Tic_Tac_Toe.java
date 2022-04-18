package Tic_Tac_Toe;

import java.util.Random;
import java.util.Scanner;
import java.util.InputMismatchException;

public class Tic_Tac_Toe {
	public static void main(String[] args) {
		
		char[][] board = new char[3][3]; // 게임판을 나타내는 2차원 배열
		int num; int num_com;
		int x=0; int y=0;
		boolean game_check = true; char player_win = 'd';
		
		Scanner scan  = new Scanner(System.in);
		Random random = new Random();
		
		// 게임판을 나타내는 2차원 배열을 초기화
		for (int i = 0; i < 3; i++) 
			for (int j = 0; j < 3; j++)
				board[i][j] = ' ';
		
		// 게임판을 그린다.
		System.out.println("  " + 1 + "|  " + 2 + "|  " + 3);
		System.out.println("---|---|---");
		System.out.println("  " + 4 + "|  " + 5 + "|  " + 6);
		System.out.println("---|---|---");
		System.out.println("  " + 7 + "|  " + 8 + "|  " + 9);
		
		while(game_check) {
			
			// 틱택토 게임 종료 판단 --- 0
			int count = 0;
			boolean com_check = true;
			boolean play_check = true;
			for (int i = 0; i < 3; i++) 
				for (int j = 0; j < 3; j++)
					if (board[i][j] != ' ')
						count += 1;
			if (count == 8) {
				com_check = false;
			} else if (count == 9) {
				play_check = false;
			}
			
			while(play_check) {
				// 사용자가 놓은 위치를 입력 --- 1
				System.out.print("다음 수의 좌표를 입력하시오: ");
				while(true) {
					try {
						// 예외 발생 가능성이 있는 코드
						num = scan.nextInt();
						break;
					} catch (InputMismatchException e) {
						scan = new Scanner(System.in);
						System.out.print("잘못된 좌표입니다. 정수만 입력하세요. :");
						num = scan.nextInt();
						continue;
					}
				}
				switch(num) {
					case 1:
						x = 0; y = 0; break;
					case 2:
						x = 0; y = 1; break;
					case 3:
						x = 0; y = 2; break;
					case 4:
						x = 1; y = 0; break;
					case 5:
						x = 1; y = 1; break;
					case 6:
						x = 1; y = 2; break;
					case 7:
						x = 2; y = 0; break;
					case 8:
						x = 2; y = 1; break;
					case 9:
						x = 2; y = 2; break;
					default:
						System.out.print("잘못된 좌표입니다. 0 ~ 9 사이의 정수를 입력하세요.\n");
						continue;
				}
				// 사용자가 놓은 위치를 검사 --- 1
				if (board[x][y] != ' ') {
					System.out.println("잘못된 위치입니다.");
					continue;
				} else {
					board[x][y] = 'O';
				}
				
				// 컴퓨터가 놓은 위치를 결정 --- 2
				while(com_check) {
					num_com = random.nextInt(8) + 1; //1이상 n이하의 무작위 정수
					switch(num_com) {
						case 1:
							x = 0; y = 0; break;
						case 2:
							x = 0; y = 1; break;
						case 3:
							x = 0; y = 2; break;
						case 4:
							x = 1; y = 0; break;
						case 5:
							x = 1; y = 1; break;
						case 6:
							x = 1; y = 2; break;
						case 7:
							x = 2; y = 0; break;
						case 8:
							x = 2; y = 1; break;
						case 9:
							x = 2; y = 2; break;
					}
					// 컴퓨터가 놓은 위치를 검사 --- 2
					if (board[x][y] != ' ') {
						continue;
					} else {
						board[x][y] = 'X';
						break;
					}
				}
				
				// 게임판 그리기 --- 3
				for (int i = 0; i < 3; i++) {
					System.out.println("  " + board[i][0] + "|  " + board[i][1] + "|  " + board[i][2]); 
					if (i != 2) 
						System.out.println("---|---|---");				
				}
				break;
			}
				
			// 승리 여부 판단 --- 4
			for (int i = 0; i < 3; i++) {
				if ((board[i][0] == 'O' && board[i][1] == 'O' && board[i][2] == 'O')||
						(board[0][i] == 'O' && board[1][i] == 'O' && board[2][i] == 'O')||
						(board[0][0] == 'O' && board[1][1] == 'O' && board[2][2] == 'O')||
						(board[2][0] == 'O' && board[1][1] == 'O' && board[0][2] == 'O')) {
					player_win = 'y';
					game_check = false;
					break;
				}
				if ((board[i][0] == 'X' && board[i][1] == 'X' && board[i][2] == 'X')||
						(board[0][i] == 'X' && board[1][i] == 'X' && board[2][i] == 'X')||
						(board[0][0] == 'X' && board[1][1] == 'X' && board[2][2] == 'X')||
						(board[2][0] == 'X' && board[1][1] == 'X' && board[0][2] == 'X')) {
					player_win = 'n';
					game_check = false;
					break;
				}
			}
		}
		
		if(player_win == 'y') {
			System.out.println("플레이어 승리!");
		} else if(player_win == 'n') {
			System.out.println("컴퓨터 승리!");
		} else {
			System.out.println("비겼습니다!");
		}
	}
}