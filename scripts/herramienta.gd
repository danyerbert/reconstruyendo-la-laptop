extends Area2D

signal recolectar_herramientas

func _on_body_entered(body):
	if body.is_in_group("jugador"):
		emit_signal("recolectar_herramientas")
		queue_free()
