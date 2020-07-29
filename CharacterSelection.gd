extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#$Character.texture.set()


func _on_Left_pressed():
	if Globals.Player1 > 0:
		Globals.Player1 -=1


func _on_Right_pressed():
	if Globals.Player1 < 4:
		Globals.Player1 +=1


func _on_Start_pressed():
	get_tree().change_scene("res://MainStage.tscn")
