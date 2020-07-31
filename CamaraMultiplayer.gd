extends Camera2D




onready var players = []
onready var Chars = []
export var PaddingPercent = 10
#var Bola

func createPointsGUI():
	var pointGui = preload("res://Points.tscn")
	for i in PlayerGlobals.Number_of_players:
		var node = pointGui.instance()
		node.Player_c = PlayerGlobals.Players[i]
		$CanvasLayer/HBoxContainer.add_child(node)
func _ready():
	self.limit_bottom = get_parent().camera_limit_botom
	self.limit_top= get_parent().camera_limit_top
	self.limit_left = get_parent().camera_limit_left
	self.limit_right= get_parent().camera_limit_right
	
	createPointsGUI()
	#Bola = get_tree().get_nodes_in_group("Ball")[0]
	var number_of_players = PlayerGlobals.Number_of_players
	if((number_of_players % 2) == 0):
		$CanvasLayer/HBoxContainer.margin_left = -13
	else:
		$CanvasLayer/HBoxContainer.margin_left = -52
		
	for i in number_of_players:
		players.append(PlayerGlobals.Players[i])
		Chars.append(PlayerGlobals.Players[i].Character)

func CalculateBox(InScreenSize):
	#infinity for the min max formulas to work
	var MinX = INF
	var MaxX = -INF
	var MinY = INF
	var MaxY = -INF
	#The way this works is it keeps the data from the nodes with the lowest -x,-y and highest x,y
	for player in Chars:
		#Will only work with 2D, 3D needs transform.origin
		var pos = player.position

		MinX = min(MinX,pos.x) # if pos.x is less than infinty keep it
		MaxX = max(MaxX,pos.x) # if pos.x is more than negative infinty keep it

		MinY = min(MinY,pos.y) # the next pass it compares the old kept value with the new
		MaxY = max(MaxY,pos.y) # keeping the most relavent number for that corner
#  This makes the ball be on camera at all times too. The problem is that the ball baunces too much and the camera makes you dizzy.
#	var pos = Bola.position
#
#	MinX = min(MinX,pos.x) # if pos.x is less than infinty keep it
#	MaxX = max(MaxX,pos.x) # if pos.x is more than negative infinty keep it
#
#	MinY = min(MinY,pos.y) # the next pass it compares the old kept value with the new
#	MaxY = max(MaxY,pos.y) 
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


	var most_left = Chars[0].global_position.x
	var most_right = Chars[0].global_position.x
	var most_up = Chars[0].global_position.y
	var most_down = Chars[0].global_position.y
	var zoom_factor1 = abs(Chars[0].global_position.x) 
	var zoom_factor2 = abs(Chars[0].global_position.y)
	
	for i in range(Chars.size()):
			most_left = min (most_left, Chars[i].global_position.x)
			most_right = max (most_right, Chars[i].global_position.x)
			most_up = min (most_up, Chars[i].global_position.y)
			most_down = max (most_up, Chars[i].global_position.y)

	var ScreenSize = self.get_viewport_rect().size
	var CustomRect2 = CalculateBox(ScreenSize)

	var ZoomRatio = max(CustomRect2.size.x/ get_viewport_rect().size.x ,\
	 CustomRect2.size.y/ get_viewport_rect().size.y)
	#print(ZoomRatio)
	self.global_position = CustomRect2.position
	#ZoomRatio is a scalar so we need to turn it into a vector
	self.zoom = Vector2(1,1)* max(ZoomRatio,1)
	
