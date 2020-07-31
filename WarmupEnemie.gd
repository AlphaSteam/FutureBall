extends KinematicBody2D


var velocity = Vector2()
var is_dead = false
const INITALPHA = 1.0
var alpha = INITALPHA
var timer = 30.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
#	velocity = move_and_slide(velocity)
#	for i in get_slide_count():
#		var collision = get_slide_collision(i)
#		print("I collided with ", collision.collider.name
	if is_dead:
		alpha -= alpha * 0.1
		$Sprite.modulate = Color(1,1,1,alpha)			
		$CollisionShape2D.disabled = true
		timer -= 0.1
	
	if timer < 0:
		$Sprite.modulate = Color(1,1,1,1)			
		$CollisionShape2D.disabled = false
		timer = 30.0
		is_dead = false

func dead():
	is_dead = true

