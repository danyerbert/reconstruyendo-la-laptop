extends CharacterBody2D

const enemigo_misterioso_run = 20
const gravity = 98
func _ready():
	velocity.x = enemigo_misterioso_run
	$AnimatedSprite2D.play("run")

func _physics_process(_delta):
	velocity.y += gravity
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = enemigo_misterioso_run
		else:
			velocity.x = -enemigo_misterioso_run
	if velocity.x < 0: 
		$AnimatedSprite2D.flip_h = false
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	
	move_and_slide()

func _on_area_2d_body_entered(_body):
	if _body.is_in_group("jugador"):
		_body.hit()

