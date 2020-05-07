extends KinematicBody2D

const DEFSPEED=160
const DEFFRICTION = 0.3
const DEFACC = 0.7
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
const DRAG = 10

var velocity = Vector2()
var on_ground = false
var dash = false
var speed = DEFSPEED
var friction = DEFFRICTION
var acceleration = DEFACC
var cooldown = false
var double_jump = true # Do I have a second jump available?

func _physics_process(delta):
	var input_velocity = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		input_velocity.x += 1
		if Input.is_action_just_pressed("Dash"):
			
			_dash(delta,velocity.y)
		
	if Input.is_action_pressed("Left"):
		input_velocity.x -= 1
		if Input.is_action_just_pressed("Dash"):
			_dash(delta,velocity.y)
	
		
	
	if Input.is_action_just_pressed("Up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
			
			
	if (dash == false):	
		velocity.y += GRAVITY
	
		
	
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false		
		
	input_velocity = input_velocity.normalized() * speed
	if input_velocity.length() > 0:
		velocity.x = velocity.linear_interpolate(input_velocity, acceleration).x
	else:
		# If there's no input, slow down to (0, 0)
		velocity.x = velocity.linear_interpolate(Vector2.ZERO, friction).x
	print(velocity)
	velocity = move_and_slide(velocity,FLOOR)



func _dash(delta,y_speed):
	if(cooldown == false):
		speed = DEFSPEED * 3
		dash = true
		cooldown = true
		velocity.y = 0
		$"Dash Time".start()



func _on_Dash_Time_timeout():
	dash = false
	speed = DEFSPEED
	$"Dash Cooldown".start()

func _on_Dash_Cooldown_timeout():
	cooldown = false
	
