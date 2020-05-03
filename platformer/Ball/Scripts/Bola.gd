extends RigidBody2D

#Variables
#Lanzamiento
#La bola se lanza arrastrando el mouse hacia el objetivo
var dragging #detecta el arrastre del mouse
var drag_start = Vector2() #detecta donde parte el arrastre

#Estado de la bola
#La bola tiene dos estados, si esta viva (puede golpear) o muerta (puede tomarse)
var live_ball = false
#Si la tiene agarrada un jugador o no
var picked 


#Detectar contactos
func _ready():
	#set_physics_process(false)
	#get_parent().remove_child(self)
	#new_parent.add_child(node)
	contact_monitor = true
	set_max_contacts_reported(3 > 0)
	set_mode(0)

#func _physics_change(mode):
#	if picked == true:
#		mode = MODE_STATIC 
#	elif picked == false:
#		mode = MODE_RIGID
	


#Señal de que la bola tocó algo
func _on_Bola_body_entered(body):
	if live_ball == true: #Si la bola esta viva
		print('toque algo')
		live_ball = false
		$Sprite.texture = load("res://Ball/ball_dead.png")



func _on_Area2D_body_entered(body):
	if body.is_in_group("Jugador"):
		if live_ball == true:
			picked = false
			print("golpeó y murió")
		elif live_ball == false:
			picked = true
			set_mode(3)
			print("agarra la bola")

func _pickup(picked):
	if picked == true:
		self.get_parent().remove_child(self) # error here  
		print(get_parent())
		get_node("Player").add_child(self)
		print(get_parent())



#Mecanica de lanzamiento con mouse

func _input(event):
#Detecta posición inicial	
	if picked == true:
		if event.is_action_pressed("attack") and not dragging:
			dragging = true
#			mode = MODE_STATIC
			drag_start = get_global_mouse_position()
			
#Detecta posición final, cambia estado de la bola a viva
		if event.is_action_released("attack") and dragging:
			dragging = false
			set_mode(0)
			yield(get_tree().create_timer(0.01), "timeout")
			$Sprite.texture = load("res://Ball/ball_live.png")
			var drag_end = get_global_mouse_position()
			var dir = -(drag_start - drag_end)
			apply_central_impulse(dir * 3)
#			apply_impulse(Vector2(), dir * 5)
			live_ball = true
			picked = false




