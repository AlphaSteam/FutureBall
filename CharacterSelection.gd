extends Node2D


var Nodes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerGlobals.createCharArray()
	PlayerGlobals.createPlayers()
	for i in PlayerGlobals.Number_of_players:
		var Character = preload("res://CharacterSelect.tscn")
		var node = Character.instance()
		$Players.add_child(node)
		Nodes.append(node)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame
	#$Character.texture.set()



func _on_Start_pressed():
	for i in PlayerGlobals.Number_of_players:
		PlayerGlobals.Players[i].Character = PlayerGlobals.Chars[Nodes[i].Selected_char].duplicate()
	get_tree().change_scene_to(LevelGlobals.selectedLevel_packed)


func _on_Start_mouse_entered():
	SfxHover.play()
