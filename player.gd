extends KinematicBody2D

onready var anim = $AnimatedSprite

func _physics_process(delta):

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
