extends "res://Stage.gd"



# Called when the node enters the scene tree for the first time.
func _ready():
	maxPlayers = 2
	camera_limit_top = -1000000000
	camera_limit_left = -1000000000
	camera_limit_botom = 326
	camera_limit_right = 100000000000

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
