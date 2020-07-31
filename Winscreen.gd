extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.KillProps()
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


func _on_TextureButton_mouse_entered():
	SfxHover.play()
