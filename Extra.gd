extends Control


func _on_TextureButton3_pressed():
	var estado_nuevo = not visible
	visible = estado_nuevo


func _on_Close_pressed():
	var estado_nuevo = not visible
	visible = estado_nuevo


#func _on_CheckBox_pressed():
#	var estado_music = not 
#	AudioServer.set_bus_mute(1, true)












func _on_Credits_mouse_entered():
	$SFXHover.play()


func _on_Credits_pressed():
	get_tree().change_scene("res://GodotCredits.tscn")
