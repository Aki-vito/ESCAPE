extends KinematicBody2D
export (int) var speed = 100
var velo = Vector2()
onready var anim = $AnimatedSprite
var tru = true 
var entered = false
onready var zozo = get_node("/root/Node2D/zozo")
var hito = false
var jumpo = false
var pos = Vector2()
func get_input():
	var axisa = Input.get_action_strength("right") - Input.get_action_strength("left")
	velo = Vector2()
	
	if Input.is_action_just_pressed("space"):
		jumpo = true
		anim.animation = "jump"
		yield(get_tree().create_timer(1), "timeout")
		jumpo = false
	
	elif Input.is_action_pressed("right"):
		velo.x += 1
	elif Input.is_action_pressed("left"):
		velo.x -= 1
		
	elif Input.is_action_pressed("control"):
		hito = true
		anim.animation = "attack" 
		yield(get_tree().create_timer(2), "timeout")
		hito = false
	velo = velo.normalized() * speed

func _physics_process(delta):
	get_input()
	pos = Vector2()
	velo = move_and_slide(velo)

	var axisX = Input.get_action_strength("right") - Input.get_action_strength("left")
	if axisX > 0 and hito == false:
		anim.animation = "run"
		anim.flip_h = false
	elif axisX < 0 and hito == false:
		anim.animation = "run"
		anim.flip_h = true	
	elif axisX == 0 and hito == false and jumpo == false:
		anim.animation = "idle"
	elif axisX == 0 and hito == false and jumpo == true:
		self.position.x += 1.5
	

	_dies()

func _on_Object_body_entered(body):
		entered = true
func _on_Object_body_exited(body):
		entered = false
func _dies():
	if entered == true:
		if anim.get_animation() == "attack":
			yield(get_tree().create_timer(1.15), "timeout")

			zozo.hide()			
		

