extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	PlayerGlobals.spawnPlayers()
	Globals.spawnBall()
func _process(delta):
	if Input.is_action_just_pressed("Toggle full screen"):
		 OS.window_fullscreen = !OS.window_fullscreen
		
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Titlescreen.tscn")
			



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

