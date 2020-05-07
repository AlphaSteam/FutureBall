extends KinematicBody2D

const DEFSPEED=180
const DEFFRICTION = 0.4
const DEFACC = 0.8
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
const DRAG = 10

var velocity = Vector2(0,0)
var on_ground = false
var jump_power = 0
var dash = false
var speed = DEFSPEED
var friction = DEFFRICTION
var acceleration = DEFACC
var cooldown = false
var double_jump = true # Do I have a second jump available?
var end_jump = false
var end_jump_after = false
func _physics_process(delta):
	var input_velocity = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		input_velocity.x += 1
		if Input.is_action_just_pressed("Dash"):
			
			_dash()
		
	if Input.is_action_pressed("Left"):
		input_velocity.x -= 1
		if Input.is_action_just_pressed("Dash"):
			_dash()
	
		
	
	if Input.is_action_just_pressed("Up"):
		if on_ground == true:
			velocity.y = JUMP_POWER
			on_ground = false
			end_jump = false
			$"Minimun jump duration".start()
			
	if(dash == false):		
		velocity.y += GRAVITY
	
	
	 
	if velocity.y < 0 && Input.is_action_just_released("Up") && end_jump == true:
		_end_jump()
	elif velocity.y < 0 && Input.is_action_just_released("Up") && end_jump == false:
		end_jump_after = true
	
	if is_on_floor():
		on_ground = true
		if(dash== false):
			speed = DEFSPEED
		
	else:
		on_ground = false
		
		if(dash == false):
			speed=4*DEFSPEED/5
		
	input_velocity = input_velocity.normalized() * speed
	if input_velocity.length() > 0:
		velocity.x = velocity.linear_interpolate(input_velocity, acceleration).x
	else:
		# If there's no input, slow down to (0, 0)
		velocity.x = velocity.linear_interpolate(Vector2.ZERO, friction).x
	#print(velocity)
	velocity = move_and_slide(velocity,FLOOR)
	
func _end_jump():
	velocity.y += - velocity.y*0.98#Jump Height depends on how long you will hold key
	end_jump = false

func _dash():
	if(cooldown == false):
		acceleration = 0.5
		speed = speed + (DEFSPEED * 3 - speed) * 0.8
		velocity.y = 0
		dash = true
		cooldown = true
		
		$"Dash Time".start()



func _on_Dash_Time_timeout():
	dash = false
	#speed = DEFSPEED * 3  + (DEFSPEED  - DEFSPEED * 3) * 0
	acceleration = DEFACC
	friction = DEFFRICTION
	$"Dash Cooldown".start()

func _on_Dash_Cooldown_timeout():
	cooldown = false
	


func _on_Minimun_jump_duration_timeout():
	end_jump = true
	
	if (end_jump_after):
		_end_jump()
		end_jump_after= false
