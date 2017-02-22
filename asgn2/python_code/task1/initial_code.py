class Connect_Four:
	'the connect four playboard'
	def __init__(self):
		print 'a new Connect Four is created'
	def StartGame(self):
		print 'this is a new game !'
	def PrintGameBoard(self):
		print 'here is the playboard'
	
	

class Player:
	playerSymbol = 'O'
	def __init__(self, PlayerSymbol):
		print 'the new player is created'
		self.playerSymbol = PlayerSymbol
	def NextColumn(self, gameBoard):
		print 'the next column is shown to choose'
	def ShowPlayerType(self):
		print 'the player is ', self.playerSymbol





#print 'the connect-4 game begins !'
row1=row2=row3=row4=row5=row6=['O','O','O','O','O','O','O']
game_board = [row1,row2,row3,row4,row5,row6]
for row in game_board:
	print row[0:]
print Connect_Four.__doc__
A_Game = Connect_Four()
A_Game.StartGame()
A_Game.PrintGameBoard()
Human_Player = Player('O')
Human_Player.ShowPlayerType
AI_Player = Player('X')
AI_Player.ShowPlayerType

#print game_board


