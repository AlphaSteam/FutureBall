extends KinematicBody2D

const DEFSPEED=120
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)

var velocity = Vector2()
var on_ground = false
var dash = false
var speed = 120

func _physics_process(delta):
	
	if Input.is_action_pressed("Right"):
		velocity.x = speed
		if Input.is_action_just_pressed("Dash"):
			_dash();
		
	elif Input.is_action_pressed("Left"):
		velocity.x = -speed
		if Input.is_action_just_pressed("Dash"):
			_dash();
	else:
		velocity.x = 0
		
	
	if Input.is_key_pressed(KEY_W):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
	if (dash == false):	
		velocity.y += GRAVITY
	else:
		velocity.y = 0
	
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false		
	
	velocity = move_and_slide(velocity,FLOOR)



func _dash():
	speed = 400
	dash = true
	$Timer.start()



func _on_Timer_timeout():
	speed = DEFSPEED
	dash = false
