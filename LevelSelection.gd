extends Node2D

onready var length
var selectedLevelInstance
func updateLevel():
	var Thumbnail = LevelGlobals.Thumbnails[LevelGlobals.selectedLevel]
	$"HBoxContainer/Level thumbnails/CenterContainer/Level".texture = Thumbnail
	LevelGlobals.selectedLevel_packed = LevelGlobals.Levels[LevelGlobals.selectedLevel]
	selectedLevelInstance = LevelGlobals.selectedLevel_packed.instance()
	if PlayerGlobals.Number_of_players > selectedLevelInstance.maxPlayers:
		PlayerGlobals.Number_of_players = selectedLevelInstance.maxPlayers
	elif PlayerGlobals.Number_of_players < 2:
		PlayerGlobals.Number_of_players = 2
	updateNPlayers()
func updateNPlayers():
	$"HBoxContainer/Settings/Number of players/N players/CenterContainer/Number of players".text = str(PlayerGlobals.Number_of_players)
	$"HBoxContainer/Settings/Number of players/Max players".text = "Max players: "+str( selectedLevelInstance.maxPlayers)
func updateTime():
	$"HBoxContainer/Settings/Time limit/Time/CenterContainer/Time limit".text = str(PlayerGlobals.ROUND_TIME)

func updatePoints():
	$"HBoxContainer/Settings/Points to win/Points/CenterContainer/Points".text = str(PlayerGlobals.points_to_win)

func _ready():
	Globals.KillProps()
	PlayerGlobals.createCharArray()
	PlayerGlobals.createPlayers()
	LevelGlobals.createLevelsArray()
	length = LevelGlobals.Levels.size()-1
	updateLevel()
	updateNPlayers()
	updateTime()
	updatePoints()

# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_Start_pressed():
	PlayerGlobals.timer.set_wait_time(PlayerGlobals.ROUND_TIME)
	get_tree().change_scene("res://CharacterSelection.tscn")


func _on_Right_button_pressed():
	SfxHover.play()
	if LevelGlobals.selectedLevel < length:
		LevelGlobals.selectedLevel+=1
	else:
		LevelGlobals.selectedLevel = 0
	updateLevel()


func _on_Left_button_pressed():
	SfxHover.play()
	if LevelGlobals.selectedLevel > 0:
		LevelGlobals.selectedLevel-=1
	else:
		LevelGlobals.selectedLevel = length
	updateLevel()


func _on_Right_button_players_pressed():
	SfxHover.play()
	if PlayerGlobals.Number_of_players < selectedLevelInstance.maxPlayers:
		PlayerGlobals.Number_of_players+=1
	else:
		PlayerGlobals.Number_of_players = 2
	updateNPlayers()
func _on_Left_button_players_pressed():
	SfxHover.play()
	if PlayerGlobals.Number_of_players > 2:
		PlayerGlobals.Number_of_players-=1
	else:
		PlayerGlobals.Number_of_players = selectedLevelInstance.maxPlayers
	updateNPlayers()


func _on_Start_mouse_entered():
	SfxHover.play()


func _on_Left_button_time_pressed():
	SfxHover.play()
	if PlayerGlobals.ROUND_TIME > 60:
		PlayerGlobals.ROUND_TIME -=5
	else:
		PlayerGlobals.ROUND_TIME = 60
	updateTime()
		


func _on_Right_button_time_pressed():
	SfxHover.play()
	PlayerGlobals.ROUND_TIME +=5
	updateTime()


func _on_Left_button_points_pressed():
	SfxHover.play()
	if PlayerGlobals.points_to_win > 1:
		 PlayerGlobals.points_to_win-=1
	else:
		 PlayerGlobals.points_to_win = 1
	updatePoints()


func _on_Right_button_points_pressed():
	SfxHover.play()
	if PlayerGlobals.points_to_win < 99:
		PlayerGlobals.points_to_win += 1
	else:
		PlayerGlobals.points_to_win = 99
	updatePoints()
