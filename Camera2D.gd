extends Camera2D

onready var p1 = get_tree().get_root().find_node("Player", true, false)
onready var p2 = get_tree().get_root().find_node("Player1", true, false)


func _ready():
	if p1!=null&&p2!=null: 
		set_process(true)

func _process(delta):
	var newpos = ((p1.position-Vector2(19,20))+p2.position*0.5)
	global_position = newpos
	#then comes the zoom
