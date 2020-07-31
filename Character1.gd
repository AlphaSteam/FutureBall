extends "res://Character.gd"
class_name Char1

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

func _physics_process(delta):
	if Input.is_action_just_pressed("Right_%s" % id):
		$AnimatedSprite.flip_h = true

	if Input.is_action_just_pressed("Left_%s" % id):
		$AnimatedSprite.flip_h = false	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
