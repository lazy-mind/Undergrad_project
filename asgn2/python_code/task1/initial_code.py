class Player:
    'Descriptor : The general player class, human player and AI player are subclasses of this player class'
    playerSymbol = 'O'
    def __init__(self, PlayerSymbol):
        self.playerSymbol = PlayerSymbol
    def NextColumn(self, gameBoard):
        print ('here')
        pass
    # the NextColumn function is to be override by the subclasses
    def ShowPlayerType(self):
        print 'the player is ', self.playerSymbol

class Human(Player):
    def HumanThinking(self,gameBoard):
        while(1):
            input_str=raw_input('Please choose a column:')
            if(input_str.isdigit()):
                column_index=int(input_str)
                if (column_index>=1 and column_index<=7):
                    if (gameBoard.gameboard[0][column_index-1]==' '):
                        gameBoard.UpdateGameBoard(column_index-1)
                        break;
                    else:
                        print ('invalid input column!')
                else:
                    print ('invalid input column!')
            else:
                print ('invalid input string!')
    def NextColumn(self, gameBoard):
        print ('human thinking')
        self.HumanThinking(gameBoard)

class Computer(Player):
    def ComputerThinking(self,gameBoard):
        pass
    def NextColumn(self, gameBoard):
        print ('AI thinking')
        self.ComputerThinking(gameBoard)

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
            if(input_str.isdigit()):
                input_num=int(input_str)
                if(input_num==1):
                    self.player1=Computer('O')
                    print 'Player O is Computer'
                    break
                elif(input_num==2):
                    self.player1=Human('O')
                    print 'Player O is Human'
                    break
                else:
                    print 'invalid player type!'
            else:
                print 'invalid player type!'
                
    
        #choose seconde player
        while(1):
            print 'Please choose the second player:\n1.Computer\n2.Human'
            input_str=raw_input('Your choice is:')
            if(input_str.isdigit()):
                input_num=int(input_str)
                if(input_num==1):
                    self.player2=Computer('X')
                    print 'Player X is Computer'
                    break
                elif(input_num==2):
                    self.player2=Human('X')
                    print 'Player X is Human'
                    break
                else:
                    print 'invalid player type!'
            else:
                print ('invalid player type!')

    def StartGame(self):
        print 'this is a new game !'
        self.ChoosePlayer()
    def PrintGameBoard(self):
        print '| 1 | 2 | 3 | 4 | 5 | 6 | 7 |'
        print '-----------------------------'
        for row in self.gameboard:
            print '| %c | %c | %c | %c | %c | %c | %c |' % (row[0],row[1],row[2],row[3],row[4],row[5],row[6])
            print '-----------------------------'
    def UpdateGameBoard(self,column_index):
        print 'I am not updated'
        self.PrintGameBoard()
    def IsGameOver(self):
        #check row
        for each_row in self.gameboard:
            count=1
            for index in range(1,7):
                if(each_row[index-1]==' '):
                    count=1
                elif(each_row[index]==each_row[index-1]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    print ('row')
                    return 1
        #check column
        for column_index in range(0,7):
            count=1
            for row_index in range(1,6):
                if(self.gameboard[row_index-1][column_index]==' '):
                    count=1
                elif(self.gameboard[row_index-1][column_index]==self.gameboard[row_index][column_index]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    print ('col')
                    return 1
        #check diagnal:
        return 0
	

#print Connect_Four.__doc__
#create and test Connect_Four class
A_Game = Connect_Four()
A_Game.StartGame()
A_Game.PrintGameBoard()
while(A_Game.IsGameOver()==0):
    print('next turn')
    if(A_Game.turn==1):
        #print ('turn is 1')
        A_Game.player1.NextColumn(A_Game)
        A_Game.turn=0
    else:
        #print ('turn is 0')
        A_Game.player2.NextColumn(A_Game)
        A_Game.turn=1
print('end of the game')

