extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	value = AudioServer.get_bus_volume_db(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HSlider_value_changed(value):
	var valor_slider = value
	AudioServer.set_bus_volume_db(1, lerp(AudioServer.get_bus_volume_db(1), value, 0.5))
#	if value == -24:
#		AudioServer.set_bus_mute(1, true)
#	else:
#		AudioServer.set_bus_mute(1, false)
