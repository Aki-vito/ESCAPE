extends KinematicBody2D

onready var anim = $AnimatedSprite

func _physics_process(delta):
	var axisX = Input.get_action_strength("right") - Input.get_action_strength("left")
	if axisX > 0:
		anim.animation = "run"
		anim.flip_h = false
	elif axisX < 0:
		anim.animation = "run"
		anim.flip_h = true	
	else:
		anim.animation = "idle"
		
