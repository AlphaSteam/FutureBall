extends Camera2D




onready var players = []
export var PaddingPercent = 10
func _ready():

	for i in PlayerGlobals.Number_of_players:
		players.append(PlayerGlobals.Players[i].Character)
func CalculateBox(InScreenSize):
	#infinity for the min max formulas to work
	var MinX = INF
	var MaxX = -INF
	var MinY = INF
	var MaxY = -INF
	#The way this works is it keeps the data from the nodes with the lowest -x,-y and highest x,y
	for player in players:
		#Will only work with 2D, 3D needs transform.origin
		var pos = player.position

		MinX = min(MinX,pos.x) # if pos.x is less than infinty keep it
		MaxX = max(MaxX,pos.x) # if pos.x is more than negative infinty keep it

		MinY = min(MinY,pos.y) # the next pass it compares the old kept value with the new
		MaxY = max(MaxY,pos.y) # keeping the most relavent number for that corner
	var pos = Bola.position

	MinX = min(MinX,pos.x) # if pos.x is less than infinty keep it
	MaxX = max(MaxX,pos.x) # if pos.x is more than negative infinty keep it

	MinY = min(MinY,pos.y) # the next pass it compares the old kept value with the new
	MaxY = max(MaxY,pos.y) 
	#Because Godot uses pixels we have to correct it
	var CorrectPixel =(InScreenSize /100) * PaddingPercent
	
	#Godot doesn't have a MinMaxRect but we can use a list
	var FourPointList = [
	MinX - CorrectPixel.x , 
	MaxX + CorrectPixel.x , 
	MinY - CorrectPixel.y , 
	MaxY + CorrectPixel.y ]
	#print(FourPointList)
	#This will return a Rect2
	return Rect2From4PointList(FourPointList)


#Special function for making a rect2 from the list
func Rect2From4PointList(InList):
	#Formula AX+BX/2 AY+BY/2 
	var Center = Vector2( ((InList[0] + InList[1]) /2), ((InList[3] + InList[2]) /2) )
	#Formula BX-AX BY-AY 
	var Size = Vector2( (InList[1] -InList[0]), (InList[3] - InList[2]) )
	return Rect2(Center,Size)


func _process(delta):


	var most_left = players[0].global_position.x
	var most_right = players[0].global_position.x
	var most_up = players[0].global_position.y
	var most_down = players[0].global_position.y
	var zoom_factor1 = abs(players[0].global_position.x) 
	var zoom_factor2 = abs(players[0].global_position.y)
	
	for i in range(players.size()):
			most_left = min (most_left, players[i].global_position.x)
			most_right = max (most_right, players[i].global_position.x)
			most_up = min (most_up, players[i].global_position.y)
			most_down = max (most_up, players[i].global_position.y)

	var ScreenSize = self.get_viewport_rect().size
	var CustomRect2 = CalculateBox(ScreenSize)

	var ZoomRatio = max(CustomRect2.size.x/ get_viewport_rect().size.x ,\
	 CustomRect2.size.y/ get_viewport_rect().size.y)
	print(ZoomRatio)
	self.global_position = CustomRect2.position
	#ZoomRatio is a scalar so we need to turn it into a vector
	self.zoom = Vector2(1,1)* max(ZoomRatio,1.2)
	
