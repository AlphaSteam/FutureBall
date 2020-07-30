extends Node2D


var maxPlayers = 2
var camera_limit_top = -1000000000
var camera_limit_left = -1000000000
var  camera_limit_botom = 326
var camera_limit_right = 100000000000

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

