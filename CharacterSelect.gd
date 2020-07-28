extends Control

var Selected_char = 0
var max_char = PlayerGlobals.Chars.size()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Left_button_down():
	if (Selected_char > 0):
		Selected_char -=1
	else:
		Selected_char = max_char
	print(Selected_char)

func _on_Right_button_down():
	if(Selected_char < max_char):
		Selected_char+=1
	else:
		Selected_char=0
	print(Selected_char)
