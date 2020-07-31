extends Node


onready var timer = PlayerGlobals.timer2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left > 0:
		$Sprite.visible = true
		$Label.visible = true
		$Label.set_text(str(int(timer.time_left)))
	else:	
		$Sprite.visible = false
		$Label.visible = false		

