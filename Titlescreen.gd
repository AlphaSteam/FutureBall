extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var presionado = false
onready var select = $MarginContainer/VBoxContainer/VBoxContainer/Select
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
	select.play()
	get_tree().change_scene("res://CharacterSelection.tscn")
	


func _on_Select_finished():
	get_tree().change_scene("res://CharacterSelection.tscn")
