extends KinematicBody2D
export (int) var speed = 100
var velo = Vector2()
onready var anim = $AnimatedSprite
var tru = true 
var entered = false
onready var zozo = get_node("/root/Node2D/zozo")
var hito = false
func get_input():
	velo = Vector2()
	if Input.is_action_pressed("right"):
		velo.x += 1
	if Input.is_action_pressed("left"):
		velo.x -= 1
	if Input.is_action_pressed("space"):
		hito = true
		anim.animation = "attack" 
		yield(get_tree().create_timer(2), "timeout")
		hito = false
	velo = velo.normalized() * speed

func _physics_process(delta):
	get_input()
	
	velo = move_and_slide(velo)
	var axisX = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	if axisX > 0:
		anim.animation = "run"
		anim.flip_h = false
	elif axisX < 0:
		anim.animation = "run"
		anim.flip_h = true	
	elif axisX == 0 and hito == false:
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
		

