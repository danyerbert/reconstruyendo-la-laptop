extends Area2D

func _on_body_entered(body):
	queue_free()
	var coins = get_tree().get_nodes_in_group("tarjetaMadre")
	if coins.size() == 1 :
		TextoTarjeta.visible = true
		await TextoTarjeta.iniciarAnimation()
		TextoTarjeta.visible = false

