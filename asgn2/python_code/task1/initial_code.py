class Player:
    'Descriptor : The general player class, human player and AI player are subclasses of this player class'
    playerSymbol = 'O'
    def __init__(self, PlayerSymbol):
        self.playerSymbol = PlayerSymbol
    def NextColumn(self, gameBoard):
        print 'the next column is shown to choose'
    def ShowPlayerType(self):
        print 'the player is ', self.playerSymbol

class Human(Player):
    pass

class Computer(Player):
    pass

class Connect_Four:
    'Descriptor : The connect four playboard'
    row1=row2=row3=row4=row5=row6=[' ',' ',' ',' ',' ',' ',' ']
    # instance variables
    gameboard = [row1,row2,row3,row4,row5,row6]
    player1 = Player('O')
    player2 = Player('X')
    turn = 1
    def __init__(self):
        print 'a new Connect Four is created'
    def ChoosePlayer(self):
        #choose fist player
        while(1):
            print 'Please choose the first player:\n1.Computer\n2.Human'
            input_str=raw_input('Your choice is:')
            if(input_str[0]=='1'):
                print 'Player O is Computer'
                break
            elif(input_str[0]=='2'):
                print 'Player O is Human'
                break
            else:
                print 'invalid player type!'

        #choose seconde player
        while(1):
            print 'Please choose the second player:\n1.Computer\n2.Human'
            input_str=raw_input('Your choice is:')
            if(input_str[0]=='1'):
                print 'Player X is Computer'
                break
            elif(input_str[0]=='2'):
                print 'Player X is Human'
                break
            else:
                print 'invalid player type!'

    def StartGame(self):
        print 'this is a new game !'
        self.ChoosePlayer()
    def PrintGameBoard(self):
        print '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
        print '-----------------------------'
        for row in self.gameboard:
            print '| %c | %c | %c | %c | %c | %c | %c |' % (row[0],row[1],row[2],row[3],row[4],row[5],row[6])
            print '-----------------------------'
	

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
