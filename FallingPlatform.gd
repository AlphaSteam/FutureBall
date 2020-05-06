extends KinematicBody2D

onready var animation_player = $AnimationPlayer
onready var timer = $ResetTimer
var weight = 20 


export var reset_time : float = 1.0

onready var reset_position = global_position

var velocity = Vector2()
var is_triggered = false


func _ready():
	animation_player.connect("animation_finished",self,"_on_finished")
#	set_physics_process(false)	


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		animation_player.play("shake")
	if is_triggered:
		velocity.y += Globals.GRAVITY * delta * weight
		position += velocity * delta	

func _on_finished(animation: String):
	print("Termino la animacion: ",animation)
	is_triggered = true
	

#
#func collide_with(collision: KinematicCollision2D, collider: KinematicBody2D):
#	if !is_triggered:
#		is_triggered = true
#		animation_player.play("shake")
#		velocity = Vector2.ZERO

#func _on_AnimationPlayer_animation_finished(anim_name):
#	set_physics_process(true)
##	timer.start(reset_time)

#func _on_ResetTimer_timeout():
#	set_physics_process(false)
#	yield(get_tree(),"physics_frame")
#	var temp = collision_layer""
#	collision_layer = 0
#	collision_layer = temp
#	is_triggered = false
#
