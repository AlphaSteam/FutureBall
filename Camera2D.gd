extends Node
#

onready var screen_size = Vector2(ProjectSettings.get_setting("display/window/size/width") ,ProjectSettings.get_setting("display/window/size/height") )
onready var player = get_tree().get_root().find_node("Player", true, false)
onready var last_player_pos = player.get_position()

## Called when the node enters the scene tree for the first time.
#func _ready():
#	var pos_x = last_player_pos.x
#	var pos_y = last_player_pos.y
#	var aux = Vector2(pos_x+150,pos_y-120)
#	var canvas_transform = get_viewport().get_canvas_transform()
#	canvas_transform[2] = screen_size/2 
#	get_viewport().set_canvas_transform(canvas_transform)

#func _process(delta):
#	var player_offset = last_player_pos - player.get_position()
#	last_player_pos = player.get_position()
#
#	var canvas_transform = get_viewport().get_canvas_transform()
#	canvas_transform[2] += player_offset
#	get_viewport().set_canvas_transform(canvas_transform)
#	return player_offset
