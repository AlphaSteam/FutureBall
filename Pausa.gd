extends Control


func _input(event):
	if event.is_action_pressed("Pause"):
		var estado_nuevo = not get_tree().paused
		get_tree().paused = estado_nuevo
		visible = estado_nuevo
		
		




func _on_TextureButton4_pressed():
	get_tree().quit()


func _on_TextureButton_pressed():
	var estado_nuevo = not get_tree().paused
	get_tree().paused = estado_nuevo
	visible = estado_nuevo
	get_tree().change_scene("res://CharacterSelection.tscn")

func _on_StageSelectButton_pressed():
	var estado_nuevo = not get_tree().paused
	get_tree().paused = estado_nuevo
	visible = estado_nuevo
	get_tree().change_scene("res://LevelSelection.tscn")
	

func _on_TextureButton5_pressed():
	var estado_nuevo = not get_tree().paused
	get_tree().paused = estado_nuevo
	visible = estado_nuevo
	get_tree().change_scene("res://Titlescreen.tscn")



func _on_TextureButton_mouse_entered():
	get_node("BG/SFXHover").play()
	
func _on_TextureButton2_mouse_entered():
	get_node("BG/SFXHover").play()

func _on_TextureButton3_mouse_entered():
	get_node("BG/SFXHover").play()
	
func _on_TextureButton5_mouse_entered():
	get_node("BG/SFXHover").play()
	
func _on_StageSelectButton_mouse_entered():
	get_node("BG/SFXHover").play()






func _on_TextureButton4_mouse_entered():
	get_node("BG/SFXHover").play()
