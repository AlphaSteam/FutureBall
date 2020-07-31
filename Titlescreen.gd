extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var aux = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	
	
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() ==true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()

func _on_joy_connection_changed(device_id, connected):
	pass
#	if connected:
#		print(Input.get_joy_name(device_id))
#	else:
#		print("Keyboard")





func _on_TextureButton_pressed():
	get_tree().change_scene("res://LevelSelection.tscn")


func _on_TextureButton3_pressed():
	get_tree().change_scene("res://GodotCredits.tscn")


func _on_TextureButton4_pressed():
	get_tree().quit()
	






func _on_TextureButton_mouse_entered():
	get_node("SFXHover").play()
	


func _on_TextureButton2_mouse_entered():
	get_node("SFXHover").play()


func _on_TextureButton3_mouse_entered():
	get_node("SFXHover").play()


func _on_TextureButton4_mouse_entered():
	get_node("SFXHover").play()
