extends CanvasLayer

@onready var animation = $AnimationPlayer

func iniciarAnimation():
	animation.play("mostrar")
	await animation.animation_finished
	TextoTeclado.visible = false
	Events.level_completed.emit()
