extends Node
class_name Player

var Character
var Name = ""
var shortName = ""
var Points = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func changePoints(var value):
	Points +=value
	if Points == 6 or Points == -3:
		Globals.WinScreen(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
