extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	Input.connect("joy_connection_changed", self, "_on_joy_connection_changed")
	
	$VBoxContainer/Ganador.text += Globals.Winner.Name
	$VBoxContainer/Puntaje.text += str(Globals.Winner.Points)

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Titlescreen.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() ==true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
