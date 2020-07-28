extends Camera2D



export (NodePath) var Bola
onready var players = []
func _ready():
	#Bola = get_node(Bola)
	for i in PlayerGlobals.Number_of_players:
		players.append(PlayerGlobals.Players[i].Character)
	

func _process(delta):
	
	var sum = Vector2(0,0)
	for i in players:
		sum+=i.global_position
	sum /= players.size()
	self.global_position = sum
	
	#var zoom_factor1 = abs(object1.global_position.x-object2.global_position.x)/(200)
	#var zoom_factor2 = abs(object1.global_position.y-object2.global_position.y-20)/(200)
	#var zoom_factor = max(max(zoom_factor1, zoom_factor2), 1.2)

	#self.zoom = Vector2(zoom_factor*1, zoom_factor*1)
