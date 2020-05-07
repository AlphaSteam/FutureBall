extends KinematicBody2D

const DEFSPEED=180
const DEFFRICTION = 0.4
const DEFACC = 0.8
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
const DRAG = 10
const INITJUMPS =3

var velocity = Vector2(0,0)
var on_ground = false
var jump_power = 0
var dash = false
var speed = DEFSPEED
var friction = DEFFRICTION
var acceleration = DEFACC
var cooldown = false
var jumps_available = INITJUMPS # Do I have jumps available?
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
		
		if jumps_available > 0:
			
			#if on_ground == true:
			jumps_available = jumps_available - 1
			
			velocity.y = JUMP_POWER
			on_ground = false
			end_jump = false
			$"New jump threshold".start()
			$"Minimun jump duration".start()
			
		else:
			print("test")
			
	if(dash == false):		
		velocity.y += GRAVITY
	
	
	
	
		
	if velocity.y < 0 && Input.is_action_just_released("Up") && end_jump == true:
		_end_jump()
		
	elif velocity.y < 0 && Input.is_action_just_released("Up") && end_jump == false:
		end_jump_after = true
	
	if is_on_floor():
		jumps_available = INITJUMPS
		on_ground = true
		if(dash== false):
			speed = DEFSPEED
		
	else:
		on_ground = false
		if(dash == false):
			speed=4.0*DEFSPEED/6
		
	input_velocity = input_velocity.normalized() * speed
	if input_velocity.length() > 0:
		velocity.x = velocity.linear_interpolate(input_velocity, acceleration).x
	else:
		# If there's no input, slow down to (0, 0)
		velocity.x = velocity.linear_interpolate(Vector2.ZERO, friction).x
	#print(velocity)
	velocity = move_and_slide(velocity,FLOOR)
	print(jumps_available)
	
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
		$"New jump threshold".start()
		$"New jump threshold".paused = true
		$"Dash Time".start()



func _on_Dash_Time_timeout():
	dash = false
	acceleration = DEFACC
	friction = DEFFRICTION
	$"New jump threshold".paused = false
	$"Dash Cooldown".start()

func _on_Dash_Cooldown_timeout():
	cooldown = false
	


func _on_Minimun_jump_duration_timeout():
	print("test 2")
	end_jump = true
	if (end_jump_after):
		_end_jump()
		end_jump_after= false


func _on_New_jump_threshold_timeout():
	jumps_available = 0
