extends CharacterBody2D
const mini_escorpion_run = 20
const gravity = 98

func _ready():
	velocity.x = mini_escorpion_run
	$AnimatedSprite2D.play("run")

func _physics_process(_delta):
	velocity.y += gravity
	if is_on_wall():
		if $AnimatedSprite2D.flip_h:
			velocity.x = mini_escorpion_run
		else:
			velocity.x = -mini_escorpion_run
	if velocity.x < 0: 
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		body.hit()
