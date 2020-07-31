extends "res://Characters/Character/Character.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	DEFSPEED=100
	DEFFRICTION = 0.4
	DEFACC = 0.8
	DEFGRAVITY = 10
	JUMP_POWER = -300
	FLOOR = Vector2(0,-1)
	INITJUMPS =40
	INITDASHES =2
	WALLFALLSPEED = 8 # Replace with function body.
	POWER = 5
	MAXPOWER = 50
	POWERSPEED = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
