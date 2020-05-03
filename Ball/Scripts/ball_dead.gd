extends Sprite

var live_ball = true
var char_tex = load("res://Ball/ball_dead.png") 


func _ready():
	set_process_input(true)
	texture = char_tex
#
