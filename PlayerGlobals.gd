extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Number_of_players =2
var Players = []
var Chars = []
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()# Replace with function body.

func createCharArray():
	Chars =[]
	Chars.append(preload("res://Character1.tscn").instance())
	Chars.append(preload("res://Character.tscn").instance())
	

func createPlayers():
	
	for i in Players:
		i.queue_free()
	Players = []
	for i in Number_of_players:
		var player = Player.new()
		player.Name = "ṔPlayer	 " + str(i)
		player.shortName = "ṔP" + str(i)
		Players.append(player)
	

func spawnPlayers():
	for i in get_tree().get_nodes_in_group("Jugador"):
		i.queue_free()
	var spawn_points = get_tree().get_nodes_in_group("Player spawn")
	var length = spawn_points.size()
	var a = []
	for j in range(length):
		a.append(j)  
	for i in PlayerGlobals.Number_of_players:
		var random = randi()%a.size()
		#print(random)
		var spawn_p = spawn_points[a[random]].get_global_position()
		var character = Players[i].Character
		character.id = i
		character.global_position = spawn_p
		add_child(character)
		a.remove(random)
		#Spawn player on point
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
