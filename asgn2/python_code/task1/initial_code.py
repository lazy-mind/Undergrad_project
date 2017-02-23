class Connect_Four:
    'Descriptor : The connect four playboard'
    row1=row2=row3=row4=row5=row6=[' ',' ',' ',' ',' ',' ',' ']
    game_board = [row1,row2,row3,row4,row5,row6]
    def __init__(self):
        print 'a new Connect Four is created'
    def StartGame(self):
        print 'this is a new game !'
    def PrintGameBoard(self):
        print '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
        print '-----------------------------'
        for row in self.game_board:
            print '| %c | %c | %c | %c | %c | %c | %c |' % (row[0],row[1],row[2],row[3],row[4],row[5],row[6])
            print '-----------------------------'
	
	

class Player:
    'Descriptor : The general player class, human player and AI player are subclasses of this player class'
    playerSymbol = 'O'
    def __init__(self, PlayerSymbol):
        print 'the new player is created'
        self.playerSymbol = PlayerSymbol
    def NextColumn(self, gameBoard):
        print 'the next column is shown to choose'
    def ShowPlayerType(self):
        print 'the player is ', self.playerSymbol


print Connect_Four.__doc__
#create and test Connect_Four class
A_Game = Connect_Four()
A_Game.StartGame()
A_Game.PrintGameBoard()
#create and test Player class
Human_Player = Player('O')
Human_Player.ShowPlayerType()
AI_Player = Player('X')
AI_Player.ShowPlayerType()
