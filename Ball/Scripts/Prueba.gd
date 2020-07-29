extends AudioStreamPlayer

var touched=false 
func set_touched():
	touched=true

func _on_GenericBall_body_entered(body):
	if touched==false:
		#print(str(self)+" hits "+str(body))
		get_stream_playback()

	var other_node=body.get_owner().get_node(body.get_name())
	if other_node.has_method("set_touched"):
		other_node.set_touched()

func _on_GenericBall_body_exited(body):
	touched=false
