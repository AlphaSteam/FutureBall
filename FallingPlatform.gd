extends KinematicBody2D

onready var animation_player = $AnimationPlayer
onready var timer = $ResetTimer
var weight = 20 


onready var reset_position = position

var velocity = Vector2()
var is_triggered = false

const INITALPHA = 1.0
var alpha = INITALPHA
var modulate_loop = false
func _ready():
	set_physics_process(false)


func _physics_process(delta):
	velocity.y += Globals.GRAVITY * delta * weight
	position += velocity * delta
	
	
func _process(delta):
	if(modulate_loop == true):
		alpha -= alpha * 0.1
		$Sprite.modulate = Color(1,1,1,alpha)
		if alpha <= 0.2:
			$Collision.disabled = true
	else:
		$Collision.disabled = false
	
func collide_with(collision: KinematicCollision2D,colider:KinematicBody):
	if !is_triggered:
		is_triggered = true
		animation_player.play("shake")
		# Para que la plataforma no vuelva a tener la misma velocidad se resetea
		velocity = Vector2.ZERO

func _on_ResetTimer_timeout():
	
	set_physics_process(false)
	yield(get_tree(),"physics_frame")
	position =  reset_position
	modulate_loop = false
	is_triggered = false
	alpha = INITALPHA
	$Sprite.modulate = Color(1,1,1,alpha)
	

func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
	modulate_loop = true
	timer.start()
