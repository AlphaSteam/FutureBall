extends KinematicBody2D

const DEFSPEED=180
const DEFFRICTION = 0.4
const DEFACC = 0.8
const DEFGRAVITY = 10
const JUMP_POWER = -300
const FLOOR = Vector2(0,-1)
const INITJUMPS =3
const INITDASHES =2
const WALLFALLSPEED = 8

var gravity = DEFGRAVITY
var velocity = Vector2(0,0)
var on_ground = false
var jump_power = 0
var dash = false
var speed = DEFSPEED
var friction = DEFFRICTION
var acceleration = DEFACC
var cooldown = false
var jumps_available = INITJUMPS   # Do I have jumps available?
var dashes_available = INITDASHES # Do I have dashes available?
var end_jump = false
var end_jump_after = false
var on_wall = false
var flip_character_once = false # Used to flip the character when sliding through a wall, so I don't do it more than once.

	

func _physics_process(delta):
	var input_velocity = Vector2.ZERO
	if Input.is_action_just_pressed("Right"):
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("Right"):
		$AnimatedSprite.play("run")
		
		input_velocity.x += 1
		if Input.is_action_just_pressed("Dash"):
			
			_dash()
	if Input.is_action_just_pressed("Left"):
		$AnimatedSprite.flip_h = true	
	if Input.is_action_pressed("Left"):
		$AnimatedSprite.play("run")
		input_velocity.x -= 1
		if Input.is_action_just_pressed("Dash"):
			_dash()
	
	if Input.is_action_just_pressed("Up"):
		if jumps_available > 0 and on_wall == false:
			jumps_available = jumps_available - 1
			
			velocity.y = JUMP_POWER
			on_ground = false
			end_jump = false
			
			$"Minimun jump duration".start()
	if  !Input.is_action_pressed("Left") && !Input.is_action_pressed("Right") && on_ground: 
		$AnimatedSprite.play("idle")
	if(dash == false):		
		velocity.y += gravity
	
	
	
	if Input.is_action_pressed("Up"):
		$"New jump threshold".start()
	
		
		
	if velocity.y < 0 && Input.is_action_just_released("Up") && end_jump == true:
		_end_jump()
		
	elif velocity.y < 0 && Input.is_action_just_released("Up") && end_jump == false:
		end_jump_after = true
	
	
		
		
	input_velocity = input_velocity.normalized() * speed
	if input_velocity.length() > 0:
		velocity.x = velocity.linear_interpolate(input_velocity, acceleration).x
	else:
		# If there's no input, slow down to (0, 0)
		velocity.x = velocity.linear_interpolate(Vector2.ZERO, friction).x
	#print(velocity)
	if on_ground && velocity.y > 0:
		jumps_available = INITJUMPS
		dashes_available = INITDASHES
	velocity = move_and_slide(velocity,FLOOR)
	
	if is_on_floor():
		
		on_ground = true
		if(dash== false):
			speed = DEFSPEED
	else:
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")
		on_ground = false
		if(dash == false):
			speed=4.0*DEFSPEED/6
	if is_on_wall() && (Input.is_action_pressed("Left") || Input.is_action_pressed("Right")) && is_on_floor()==false:
		on_wall = true
		if flip_character_once == false:
			
			$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
			flip_character_once = true
		if velocity.y > 0 :
			gravity = 0.01
		else:
			gravity = DEFGRAVITY
		if velocity.y > WALLFALLSPEED:
			velocity.y = WALLFALLSPEED
		$"New jump threshold".start()
			
	else:
		if flip_character_once == true:
			#$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h
			flip_character_once = false
		
		on_wall = false
		gravity = DEFGRAVITY
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.has_method("collide_with"):
			collision.collider.collide_with(collision,self)
	
	
func _end_jump():
	velocity.y += - velocity.y*0.9 # It doesn't kill the momentum inmediatly
	end_jump = false


func _dash():
	if(cooldown == false && dashes_available > 0):
		acceleration = 0.5
		speed = speed + (DEFSPEED * 3 - speed) * 0.8
		velocity.y = 0
		dash = true
		cooldown = true
		dashes_available -=1
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
	end_jump = true
	if (end_jump_after):
		_end_jump()
		end_jump_after= false


func _on_New_jump_threshold_timeout():
	jumps_available = 0
