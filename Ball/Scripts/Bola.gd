extends RigidBody2D

const MAXPOW = 100
const DEFPOWMULT = 4
var power_multiplier = DEFPOWMULT
var power = 0
var rebote = 0
onready var player = get_tree().get_root().find_node("Player", true, false)
onready var player1 = get_tree().get_root().find_node("Player1", true, false)
#onready var arrow_head = player.get_node("ArrowHead")
onready var arrow = player.get_node("Arrow")
onready var arrow1 = player1.get_node("Arrow")

var ball_dead = preload("res://Ball/ball_dead.png")
var ball_live = preload("res://Ball/ball_live.png")

#Variables
#Lanzamiento
#La bola se lanza arrastrando el mouse hacia el objetivo
var dragging #detecta el arrastre del mouse
var drag_start = Vector2() #detecta donde parte el arrastre

#Estado de la bola
#La bola tiene dos estados, si esta viva (puede golpear) o muerta (puede tomarse)
var live_ball = false
#Si la tiene agarrada un jugador o no
var picked = false
var cancel = false
onready var reset_position = global_position
onready var reset_arrow = arrow.rect_size 
#Detectar contactos
func _ready():
	#set_physics_process(false)
	#get_parent().remove_child(self)
	#new_parent.add_child(node)
	contact_monitor = true
	set_max_contacts_reported(3 > 0)
	set_mode(0)
	arrow.hide()
	arrow1.hide()

#func _physics_change(mode):
#	if picked == true:
#		mode = MODE_STATIC 
#	elif picked == false:
#		mode = MODE_RIGID
	


#Señal de que la bola tocó algo
func _on_Bola_body_entered(body: Node):
	if live_ball == true: #Si la bola esta viva
		if 'WarmupEnemie' in body.name:
			body.dead()
		live_ball = false
		$Sprite.texture = ball_dead	


func pick(juega: String):
	picked = true
	set_mode(3)
	var ball_position = global_position
	get_parent().remove_child(self)
	if(juega=='Player'):
		player.add_child(self)
	else:
		player1.add_child(self)
	global_position = ball_position
	$Tween.interpolate_property(self, "position", position, player.get_node("Ball").position, 1.0, Tween.TRANS_QUINT, Tween.EASE_OUT)
	$Tween.start()

func drop():
	picked = false
	set_mode(0)
	linear_velocity = Vector2.ZERO
	var new_parent = get_tree().get_root()
	var ball_position = global_position
	get_parent().remove_child(self)
	new_parent.add_child(self)
	global_position = ball_position

func _on_Area2D_body_entered(body):
	if body.is_in_group("Jugador"):
		if live_ball == true:
			picked = false
			#print("golpeó y murió")
		elif live_ball == false and not picked:
			call_deferred("pick",body.get_name())
			#print("agarra la bola")

func _pickup(picked):
	if picked == true:
		self.get_parent().remove_child(self) # error here  
		#print(get_parent())
		get_node("Player").add_child(self)
#		print(get_parent())
		

func _physics_process(delta):
	var init = global_position
			#print("position: "+str(init))
	var mouse =  get_global_mouse_position()
			#print("mouse: "+  str(mouse))
	var vect =  mouse - init
	var normalized
	if sqrt(vect.x + vect.y) != 0:
		normalized = vect / (sqrt(pow(vect.x,2) + pow(vect.y,2)))
	else:
		 normalized = vect
#	print(get_tree().get_root())
	if picked == true:
		if Input.is_action_just_pressed("attack"):
			arrow.visible = true
			cancel = false
		elif Input.is_action_pressed("attack") && cancel == false:
			if power<= MAXPOW:
					power += 2
			
			arrow.show()
			
			
#			arrow_head.rotation = drag.angle()
			arrow.rect_rotation = rad2deg(vect.angle())
			arrow.rect_size.x = power
			#arrow_head.global_position = player.position + power * vect
		if Input.is_action_just_pressed("Cancel attack"):
			cancel = true
			arrow.rect_size.x = reset_arrow.x
			arrow.hide()
			power = 0
		if Input.is_action_just_released("attack") && cancel == false:
#			yield(get_tree().create_timer(0.01), "timeout")
			$Sprite.texture = ball_live
			drop()
			apply_central_impulse(normalized * power * power_multiplier)
			live_ball = true
			arrow.rect_size.x = reset_arrow.x
			arrow.hide()
			power = 0
		
			
			
	if position.y > 400:
		position = reset_position
		linear_velocity = Vector2.ZERO



#Mecanica de lanzamiento con mouse

#func _input(event):
##Detecta posición inicial	
#	var just_pressed = event.is_pressed() and not event.is_echo()
#	if picked == true:
#		if event.is_action_pressed("attack") and just_pressed:
#			drag_start = get_global_mouse_position()
#
##		if event.is_action_pressed("attack") and not dragging:
##			dragging = true
###			mode = MODE_STATIC
##			drag_start = get_global_mouse_position()
#
##Detecta posición final, cambia estado de la bola a viva
#		if event.is_action_released("attack") and dragging:
#			dragging = false
#			set_mode(0)
#			yield(get_tree().create_timer(0.01), "timeout")
#			$Sprite.texture = load("res://Ball/ball_live.png")
#			var drag_end = get_global_mouse_position()
#			var dir = -(drag_start - drag_end)
#			apply_central_impulse(dir * 3)
##			apply_impulse(Vector2(), dir * 5)
#			live_ball = true
#			picked = false





