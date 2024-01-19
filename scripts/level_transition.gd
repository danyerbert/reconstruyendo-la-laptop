extends CanvasLayer

#Instaciamos la animación para su uso
@onready var animation_player = $AnimationPlayer

#Generamos una función para desvanecerse en negro
func fade_from_black():
	animation_player.play("fade_from_black")
	await animation_player.animation_finished
#Generamos la otra funcion para desfundir de negro
func fade_to_black():
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
