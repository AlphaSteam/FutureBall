extends Control


var Player_c



# Called when the node enters the scene tree for the first time.
func _ready():
	if is_instance_valid( Player_c ):
		$T/Name.text = Player_c.name
func changePoints(var value):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid( Player_c ):
		$T/C/Points.text = str(Player_c.Points)
	
