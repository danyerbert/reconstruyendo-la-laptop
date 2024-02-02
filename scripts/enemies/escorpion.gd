extends CharacterBody2D
const escorpion_run = 20
const gravity = 98

func _ready():
	velocity.x = escorpion_run
	$AnimatedSprite2D.play("caminar")

func _physics_process(_delta):
	velocity.y += gravity
	if is_on_wall():
		if $AnimatedSprite2D.flip_h:
			velocity.x = escorpion_run
		else:
			velocity.x = -escorpion_run
	if velocity.x < 0: 
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		body.hit()
