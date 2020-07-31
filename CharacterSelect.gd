extends Control

var Selected_char = 0
var max_char = PlayerGlobals.Chars.size()-1
onready var node = $HSeparator/MarginContainer/CharacterPos

func updateChar():
	
	var character = PlayerGlobals.Chars[Selected_char]
	var sprite = character.get_node("AnimatedSprite").duplicate()

	if(node.get_child_count() != 0):
		for n in node.get_children():
			node.remove_child(n)
			n.queue_free()
	sprite.global_scale = Vector2(2,2)
	
	node.add_child(sprite)
	
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	updateChar()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Left_button_down():
	if (Selected_char > 0):
		Selected_char -=1
	else:
		Selected_char = max_char
	updateChar()

func _on_Right_button_down():
	if(Selected_char < max_char):
		Selected_char+=1
	else:
		Selected_char=0
	updateChar()
