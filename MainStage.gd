extends Node2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)


func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("Toggle full screen"):
		 OS.window_fullscreen = !OS.window_fullscreen
