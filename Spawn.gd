extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = not $ColorRect.visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
