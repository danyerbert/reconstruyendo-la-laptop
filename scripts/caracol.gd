extends CharacterBody2D

const caracol_run = 20
const gravity = 98
func _ready():
	velocity.x = caracol_run
	$AnimatedSprite2D.play("run")

func _physics_process(_delta):
	velocity.y += gravity
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = caracol_run
		else:
			velocity.x = -caracol_run
	if velocity.x < 0: 
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()
