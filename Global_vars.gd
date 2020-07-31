extends Node2D


const SPEED = 60
const GRAVITY = 10
const JUMP_POWER = -250
const FLOOR = Vector2(0,-1)
var Winner
var ball

func _ready():
	pass
	
func _process(delta):
	pass
func WinScreen(var player):
	Winner = player
	get_tree().change_scene("res://Winscreen.tscn")
func spawnBall():
	for i in get_tree().get_nodes_in_group("Ball"):
		i.queue_free()
	ball = preload("res://Bola.tscn").instance()
	var ball_spawns = get_tree().get_nodes_in_group("Ball spawn")
	var length = ball_spawns.size()
	var a = []
	for j in range(length):
		a.append(j) 
	var random = randi()%a.size()
	var spawn_p = ball_spawns[a[random]].get_global_position()
	
	ball.global_position = spawn_p
	add_child(ball)

