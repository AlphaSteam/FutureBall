extends Node

var Levels = []
var Thumbnails = []
var selectedLevel = 0
var selectedLevel_packed
func createLevelsArray():
	Levels =[]
	Thumbnails = []
	Levels.append(preload("res://Levels/Factory/Factory 1v1.tscn"))
	Levels.append(preload("res://Levels/MStage/MainStage.tscn"))
	Thumbnails.append(preload("res://Levels/Factory/Factory 1v1.png"))
	Thumbnails.append(preload("res://Levels/MStage/MainStage ffa.png"))
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
