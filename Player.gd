extends Node
class_name Player

var Character
var Name = ""
var shortName = ""
var Points = 0
var help_id
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func changePoints(var value):
	Points +=value
	if Points >= PlayerGlobals.points_to_win:
		Globals.WinScreen(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
