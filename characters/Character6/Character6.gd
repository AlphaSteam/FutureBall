extends "res://Characters/Character/Character.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	orientation = true
	DEFSPEED=80
	DEFFRICTION = 0.4
	DEFACC = 1
	DEFGRAVITY = 20
	JUMP_POWER = -300
	FLOOR = Vector2(0,-1)
	INITJUMPS =410
	INITDASHES =2
	WALLFALLSPEED = 8 # Replace with function body.
	POWER = 15
	MAXPOWER = 50
	POWERSPEED = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
