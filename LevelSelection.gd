extends Node2D

onready var length

func updateLevel():
	var Thumbnail = LevelGlobals.Thumbnails[LevelGlobals.selectedLevel]
	$"HBoxContainer/Level thumbnails/CenterContainer/Level".texture = Thumbnail

# Called when the node enters the scene tree for the first time.
func _ready():
	
	PlayerGlobals.createCharArray()
	PlayerGlobals.createPlayers()
	LevelGlobals.createLevelsArray()
	length = LevelGlobals.Levels.size()-1
	print(length)
	updateLevel()


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_Start_pressed():
	get_tree().change_scene("res://CharacterSelection.tscn")


func _on_Right_button_pressed():
	if LevelGlobals.selectedLevel < length:
		LevelGlobals.selectedLevel+=1
	else:
		LevelGlobals.selectedLevel = 0
	print(LevelGlobals.selectedLevel)
	updateLevel()


func _on_Left_button_pressed():
	print("before ", LevelGlobals.selectedLevel)
	if LevelGlobals.selectedLevel > 0:
		LevelGlobals.selectedLevel-=1
	else:
		LevelGlobals.selectedLevel = length
	print("after ", LevelGlobals.selectedLevel)
	updateLevel()
