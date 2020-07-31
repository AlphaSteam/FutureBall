extends Node2D

onready var length
var selectedLevelInstance
func updateLevel():
	var Thumbnail = LevelGlobals.Thumbnails[LevelGlobals.selectedLevel]
	$"HBoxContainer/Level thumbnails/CenterContainer/Level".texture = Thumbnail
	LevelGlobals.selectedLevel_packed = LevelGlobals.Levels[LevelGlobals.selectedLevel]
	selectedLevelInstance = LevelGlobals.selectedLevel_packed.instance()
func updateNPlayers():
	$"HBoxContainer/Settings/Number of players/N players/CenterContainer/Number of players".text = str(PlayerGlobals.Number_of_players)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	PlayerGlobals.createCharArray()
	PlayerGlobals.createPlayers()
	LevelGlobals.createLevelsArray()
	length = LevelGlobals.Levels.size()-1
	updateLevel()
	updateNPlayers()

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_Start_pressed():
	get_tree().change_scene("res://CharacterSelection.tscn")


func _on_Right_button_pressed():
	if LevelGlobals.selectedLevel < length:
		LevelGlobals.selectedLevel+=1
	else:
		LevelGlobals.selectedLevel = 0
	updateLevel()


func _on_Left_button_pressed():
	if LevelGlobals.selectedLevel > 0:
		LevelGlobals.selectedLevel-=1
	else:
		LevelGlobals.selectedLevel = length
	updateLevel()


func _on_Right_button_players_pressed():
	if PlayerGlobals.Number_of_players < selectedLevelInstance.maxPlayers:
		PlayerGlobals.Number_of_players+=1
	else:
		PlayerGlobals.Number_of_players = 2
	updateNPlayers()
func _on_Left_button_players_pressed():
	if PlayerGlobals.Number_of_players > 2:
		PlayerGlobals.Number_of_players-=1
	else:
		PlayerGlobals.Number_of_players = selectedLevelInstance.maxPlayers
	updateNPlayers()


func _on_Start_mouse_entered():
	SfxHover.play()
