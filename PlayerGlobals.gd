extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Number_of_players = 4
var Players = []
var Chars = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func createCharArray():
	Chars.append(preload("res://Character1.tscn").instance())
	Chars.append(preload("res://Character.tscn").instance())
	

func createPlayers():
	for i in Number_of_players:
		var player = Player.new()
		player.name = "ṔPlayer " + str(i)
		PlayerGlobals.Players.append(player)
	

func spawnPlayers():
	var spawn_points = get_tree().get_nodes_in_group("SpawnPoint")
	var length = spawn_points.size()
	var a = []
	for j in range(length):
		a.append(j)  
	for i in PlayerGlobals.Number_of_players:
		var random = randi()%a.size()-1
		var spawn_p = spawn_points[random]
		var character = Players[i].Character
		var node = character.instance()
		add_child(node)
		#Spawn player on point
		a.remove(random)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
