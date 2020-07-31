extends Control


func _on_TextureButton2_pressed():
	var estado_nuevo = not visible
	visible = estado_nuevo


func _on_TextureButton4_pressed():
	var estado_nuevo = not visible
	visible = estado_nuevo


#func _on_CheckBox_pressed():
#	var estado_music = not 
#	AudioServer.set_bus_mute(1, true)








func _on_TextureButton4_mouse_entered():
	$SFXHover.play()
