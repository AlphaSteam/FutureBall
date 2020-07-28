extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerGlobals.createCharArray()
	for i in PlayerGlobals.Number_of_players:
		var select = preload("res://CharacterSelect.tscn")
		var node = select.instance()
		$CenterContainer/Selections.add_child(node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
