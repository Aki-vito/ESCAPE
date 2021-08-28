extends KinematicBody2D
export (int) var speed = 100
var velo = Vector2()
var entered = false
var exited = false
onready var anim = $AnimatedSprite
var tru = true 


func get_input():
	velo = Vector2()
	if Input.is_action_pressed("right"):
		velo.x += 1
	if Input.is_action_pressed("left"):
		velo.x -= 1
	velo = velo.normalized() * speed
			

func _physics_process(delta):
	get_input()
	var zozo = get_node($/root/Node2D/zozo)
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
	_on_Object_body_entered(zozo)
	_on_Object_body_exited(zozo)
	
func _on_Object_body_entered(body):
		entered = true
		print(entered)

func _on_Object_body_exited(body):
		exited = true


