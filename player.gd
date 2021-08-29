extends KinematicBody2D
export (int) var speed = 100
var velo = Vector2()
onready var anim = $AnimatedSprite
const gravity = 1000
var entered = false
onready var zozo = get_node("/root/Node2D/zozo")
var hito = false
var hito2 = false
var hito3 = false
func get_input():
	var axisa = Input.get_action_strength("right") - Input.get_action_strength("left")
	velo = Vector2()
	if Input.is_action_pressed("right"):
		velo.x += 1
	elif Input.is_action_pressed("left"):
		velo.x -= 1
	elif Input.is_action_pressed("control"):
		hito = true
		anim.animation = "attack1" 
		yield(get_tree().create_timer(0.7), "timeout")
		hito = false
	elif Input.is_action_just_pressed("space"):
		hito2 = true
		anim.animation = "attack2"
		yield(get_tree().create_timer(0.6), "timeout")
		hito2 = false
	elif Input.is_action_just_pressed("shift"):
		hito3 = true
		anim.animation = "attack3"
		yield(get_tree().create_timer(0.8), "timeout")
		hito3 = false
		
	velo = velo.normalized() * speed

func _physics_process(delta):
	var axisX = Input.get_action_strength("right") - Input.get_action_strength("left")
	get_input()
	velo = move_and_slide(velo)
	if axisX > 0 and hito == false and hito2 == false and hito3 == false:
		anim.animation = "run"
		anim.flip_h = false
	elif axisX < 0 and hito == false and hito2 == false and hito3 == false:
		anim.animation = "run"
		anim.flip_h = true	
	elif axisX == 0 and hito == false and hito2 == false and hito3 == false:
		anim.animation = "idle"
	 
	
	
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
		

