extends CheckButton



# Declare member variables here. Examples:
# var a = 2
var estado_init = true


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CheckBox_toggled(button_pressed):
	var estado_music = not button_pressed 
	AudioServer.set_bus_mute(1, estado_music)
	
func _ready():
	pressed = not AudioServer.is_bus_mute(1)
