extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#set_physics_process(false)
	pass # Replace with function body.

	get_parent().remove_child(self)
	#new_parent.add_child(node)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Bola_body_entered():
	get_parent().remove_child(self)
	print_tree()
	print(get_parent())

