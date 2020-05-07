extends KinematicBody2D

onready var animation_player = $AnimationPlayer
onready var timer = $ResetTimer
var weight = 20 

export var reset_time : float = 1.0

onready var reset_position = global_position

var velocity = Vector2()
var is_triggered = false


func _ready():
	set_physics_process(false)


func _physics_process(delta):
	velocity.y += Globals.GRAVITY * delta * weight
	position += velocity * delta


func collide_with(collision: KinematicCollision2D,colider:KinematicBody):
	if !is_triggered:
		is_triggered = true
		animation_player.play("shake")
		# Para que la plataforma no vuelva a tener la misma velocidad se resetea
		velocity = Vector2.ZERO

func _on_ResetTimer_timeout():
	set_physics_process(false)
	yield(get_tree(),"physics_frame")
	global_position =  reset_position
	is_triggered = false

func _on_AnimationPlayer_animation_finished(anim_name):
	set_physics_process(true)
	timer.start(reset_time)
