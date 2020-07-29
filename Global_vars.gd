extends Node2D

const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
var Winner


func _ready():
	pass
	
func _process(delta):
	pass
func WinScreen(var player):
	Winner = player
	get_tree().change_scene("res://Winscreen.tscn")

