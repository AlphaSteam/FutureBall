extends Label

var round_time=10
onready var timer = get_node("Timer")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(round_time)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(str(int(timer.time_left)))



func _on_Timer_timeout():
	print("hola") # Replace with function body.
