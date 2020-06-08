extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if int(text) == 5 or int(text) == -3:
		get_tree().change_scene("res://Winscreen.tscn")

func _on_Bola_Punto0():
	text = str(int(text) + 1)
	pass # Replace with function body.

func _on_Player0_sd0():
	text = str(int(text) - 1)
	pass # Replace with function body.
	

#func _victory():
#	if int(text) == 5 or int(text) == -3:
#		get_tree().change_scene("res://Winscreen.tscn")
