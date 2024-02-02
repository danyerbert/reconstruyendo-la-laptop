extends CharacterBody2D

var velocidad : int =  25
var perseguir : bool = false
func _ready():
	$AnimatedSprite2D.play("caminar")
	velocity.x = velocidad

func _physics_process(delta):
	if !perseguir:
		if is_on_wall():
			if !$AnimatedSprite2D.flip_h:
				velocity.x = velocidad
			else:
				velocity.x = -velocidad
		move_and_slide()
		if velocity.x < 0:
			$AnimatedSprite2D.flip_h = false
		elif velocity.x > 0:
			$AnimatedSprite2D.flip_h = true

func _on_area_2d_body_entered(body):
	if body.is_in_group("jugador"):
		body.hit()
