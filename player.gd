extends KinematicBody2D
export (int) var speed = 100
var velo = Vector2()

onready var anim = $AnimatedSprite

func get_input():
	velo = Vector2()
	if Input.is_action_pressed("right"):
		velo.x += 1
	if Input.is_action_pressed("left"):
		velo.x -= 1
	velo = velo.normalized() * speed
			

func _physics_process(delta):
	get_input()
	velo = move_and_slide(velo)
	var axisX = Input.get_action_strength("right") - Input.get_action_strength("left")
	var hito = Input.is_action_pressed("space")
	if hito == true:
		anim.animation = "attack" 
	if axisX > 0:
		anim.animation = "run"
		anim.flip_h = false
	elif axisX < 0:
		anim.animation = "run"
		anim.flip_h = true	
	elif axisX == 0 and hito == false:
		anim.animation = "idle"		
