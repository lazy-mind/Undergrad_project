import sys
from random import randint



class Player:
    'Descriptor : The general player class, human player and AI player are subclasses of this player class'
    def __init__(self, PlayerSymbol):
        self.playerSymbol = PlayerSymbol
    # the NextColumn function is to be override by the subclasses
    def NextColumn(self, gameBoard):
        pass
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
                        gameBoard.UpdateGameBoard(column_index-1,self.playerSymbol)
                        break;
                    else:
                        print ('invalid input column!')
                else:
                    print ('invalid input column!')
            else:
                print ('invalid input string!')
    def NextColumn(self, gameBoard):
        #print ('human thinking')
        self.HumanThinking(gameBoard)


class Computer(Player):
    def ComputerThinking(self,gameBoard):
        col=randint(0,6)
        while(gameBoard.gameboard[0][col]!=' '):
            col=randint(0,6)
        gameBoard.UpdateGameBoard(col,self.playerSymbol)

    def NextColumn(self, gameBoard):
        #print ('AI thinking')
        self.ComputerThinking(gameBoard)


class SmartAI(Player):
    level=0
    award=[0,0,0,0,0,0,0]
    
    opponent_symbol='X'
    
    def GetOpponentSymbol(self):
        if(self.playerSymbol=='X'):
            self.opponent_symbol='O'
        else:
            self.opponent_symbol='X'

    def ClearAward(self):
        self.award=[0,0,0,0,0,0,0]

    def SmartComputerThinking(self,gameBoard):
        self.level+=1
        #self.level define how many turns we will considered for
        while(self.level<=4):
            #try for each col
            for col in range(0,7):
                if(gameBoard.IsGameOver()==1):
                    gameBoard.ClearWinSet()
                    break
                if(gameBoard.gameboard[0][col]==' '):
                    # when it is our turn
                    #if(self.level % 2 == 1):
                    gameBoard.UpdateGameBoard(col,self.playerSymbol)
                    if(gameBoard.IsGameOver()==1):
                        gameBoard.ClearWinSet()
                        self.award[col]+=105*(1-0.1*(self.level-1))
                    gameBoard.UndoUpdate(col,self.playerSymbol)
                    # when it is the opponent turn
                    #elif(self.level % 2 == 0):
                    gameBoard.UpdateGameBoard(col,self.opponent_symbol)
                    if(gameBoard.IsGameOver()==1):
                        gameBoard.ClearWinSet()
                        self.award[col]+=100*(1-0.1*(self.level-1))
                    gameBoard.UndoUpdate(col,self.opponent_symbol)
            col = self.SmartComputerDecision(gameBoard)
            gameBoard.UpdateGameBoard(col,self.playerSymbol)
            self.SmartComputerThinking(gameBoard)
            gameBoard.UndoUpdate(col,self.playerSymbol)
            break
        self.level=0
    
    def SmartComputerDecision(self,gameBoard):
        max=1
        maxIndex=-1
        for i in range(0,7):
            if self.award[i] > max:
                max = self.award[i]
                maxIndex = i
        if(maxIndex==-1):
            maxIndex=3
            if(gameBoard.gameboard[0][maxIndex]==' '):
                return maxIndex
            else:
                while(gameBoard.gameboard[0][maxIndex]!=' '):
                    maxIndex=randint(0,6)
                return maxIndex
        if(gameBoard.gameboard[0][maxIndex]==' '):
            return maxIndex
        else:
            while(gameBoard.gameboard[0][maxIndex]!=' '):
                maxIndex=randint(0,6)
        return maxIndex
    
    def NextColumn(self, gameBoard):
        self.ClearAward()
        self.GetOpponentSymbol()
        self.SmartComputerThinking(gameBoard)
        col = self.SmartComputerDecision(gameBoard)
        gameBoard.UpdateGameBoard(col,self.playerSymbol)



class Connect_Four:
    'Descriptor : The connect four playboard'
    row1=[' ',' ',' ',' ',' ',' ',' ']
    row2=[' ',' ',' ',' ',' ',' ',' ']
    row3=[' ',' ',' ',' ',' ',' ',' ']
    row4=[' ',' ',' ',' ',' ',' ',' ']
    row5=[' ',' ',' ',' ',' ',' ',' ']
    row6=[' ',' ',' ',' ',' ',' ',' ']
    # instance variables
    gameboard = [row1,row2,row3,row4,row5,row6]
    player1 = Player('O')
    player2 = Player('X')
    turn = 1
    win_row=0
    win_col=0
    win_set=[]
    def __init__(self):
        pass
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
                elif(input_num==3):
                    self.player1=SmartAI('O')
                    print 'Player O is Computer'
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
                elif(input_num==3):
                    self.player2=SmartAI('X')
                    print 'Player X is Computer'
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
        for idx_row,row in enumerate(self.gameboard):
            for idx_col,col in enumerate(row):
                sys.stdout.write('\033[m|')
                if [idx_row,idx_col] in self.win_set:
                    sys.stdout.write('\033[7m %c ' % col)
                else:
                    sys.stdout.write(' %c ' % col)
                #print '| %c | %c | %c | %c | %c | %c | %c |' % (row[0],row[1],row[2],row[3],row[4],row[5],row[6])
            print '\033[m|'
            print '-----------------------------'

    def UpdateGameBoard(self,column_index,input_symbol):
        for row_index in range(0,6):
            if (self.gameboard[5-row_index][column_index]==' '):
                self.gameboard[5-row_index][column_index]=input_symbol
                break

    def UndoUpdate(self,column_index,input_symbol):
        for row_index in range(0,6):
            if (self.gameboard[row_index][column_index]==input_symbol):
                self.gameboard[row_index][column_index]=' '
                break

    def ClearWinSet(self):
        self.win_set=[]

    def IsGameOver(self):
        #check row
        for idx,each_row in enumerate(self.gameboard):
            count=1
            for index in range(1,7):
                if(each_row[index-1]==' '):
                    count=1
                elif(each_row[index]==each_row[index-1]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    self.win_row=idx
                    self.win_col=index
                    for i in range(0,4):
                        self.win_set.append([self.win_row,self.win_col])
                        self.win_col=self.win_col-1
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
                    self.win_row=row_index
                    self.win_col=column_index
                    for i in range(0,4):
                        self.win_set.append([self.win_row,self.win_col])
                        self.win_row=self.win_row-1
                    return 1
        #check diagnal:
        for row_num in range(0,3):
            row_index=row_num+1
            col_index=1
            count=1
            while(row_index!=6):
                if(self.gameboard[row_index-1][col_index-1]==' '):
                    count=1
                elif(self.gameboard[row_index-1][col_index-1]==self.gameboard[row_index][col_index]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    self.win_row=row_index
                    self.win_col=col_index
                    for i in range(0,4):
                        self.win_set.append([self.win_row,self.win_col])
                        self.win_row=self.win_row-1
                        self.win_col=self.win_col-1
                    return 1
                row_index=row_index+1
                col_index=col_index+1
            row_index=row_num+1
            col_index=5
            count=1
            while(row_index!=6):
                if(self.gameboard[row_index-1][col_index+1]==' '):
                    count=1
                elif(self.gameboard[row_index-1][col_index+1]==self.gameboard[row_index][col_index]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    self.win_row=row_index
                    self.win_col=col_index
                    for i in range(0,4):
                        self.win_set.append([self.win_row,self.win_col])
                        self.win_row=self.win_row-1
                        self.win_col=self.win_col+1
                    return 1
                row_index=row_index+1
                col_index=col_index-1
        for row_num in range(3,6):
            row_index=row_num-1
            col_index=1
            count=1
            while(row_index!=-1):
                if(self.gameboard[row_index+1][col_index-1]==' '):
                    count=1
                elif(self.gameboard[row_index+1][col_index-1]==self.gameboard[row_index][col_index]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    self.win_row=row_index
                    self.win_col=col_index
                    for i in range(0,4):
                        self.win_set.append([self.win_row,self.win_col])
                        self.win_row=self.win_row+1
                        self.win_col=self.win_col-1
                    return 1
                row_index=row_index-1
                col_index=col_index+1
            row_index=row_num-1
            col_index=5
            count=1
            while(row_index!=-1):
                if(self.gameboard[row_index+1][col_index+1]==' '):
                    count=1
                elif(self.gameboard[row_index+1][col_index+1]==self.gameboard[row_index][col_index]):
                    count=count+1
                else:
                    count=1
                if(count==4):
                    self.win_row=row_index
                    self.win_col=col_index
                    for i in range(0,4):
                        self.win_set.append([self.win_row,self.win_col])
                        self.win_row=self.win_row+1
                        self.win_col=self.win_col+1
                    return 1
                row_index=row_index-1
                col_index=col_index-1
        #check draw:
        for row in self.gameboard:
            for col in row:
                if(col==' '):
                    return 0
        return 2
	


A_Game = Connect_Four()
A_Game.StartGame()
A_Game.PrintGameBoard()
gameover_type=0
while(gameover_type==0):
    if(A_Game.turn==1):
        A_Game.player1.NextColumn(A_Game)
        gameover_type=A_Game.IsGameOver()
        if(gameover_type==1):
            print ('Player %c wins the game!' % A_Game.player1.playerSymbol)
        elif(gameover_type==2):
            print ('It is a draw!')
        A_Game.PrintGameBoard()
        A_Game.turn=0
    else:
        A_Game.player2.NextColumn(A_Game)
        gameover_type=A_Game.IsGameOver()
        if(gameover_type==1):
            print ('Player %c wins the game!' % A_Game.player2.playerSymbol)
        elif(gameover_type==2):
            print ('It is a draw!')
        A_Game.PrintGameBoard()
        A_Game.turn=1
    print ''
#print('end of the game')
