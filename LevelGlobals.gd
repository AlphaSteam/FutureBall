extends Node

var Levels = []
var Thumbnails = []

func createLevelsArray():
	Levels =[]
	Levels.append(preload("res://Character1.tscn").instance())
	Levels.append(preload("res://Character.tscn").instance())
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
