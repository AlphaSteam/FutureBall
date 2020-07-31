extends Label

var round_time=30
onready var timer = PlayerGlobals.timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(str(int(timer.time_left)))



func _on_Timer_timeout():
	print("hola") # Replace with function body.
