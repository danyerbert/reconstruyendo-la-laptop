extends Area2D



func _on_body_entered(_body):
	queue_free()
	var coins = get_tree().get_nodes_in_group("teclado")
	if coins.size() == 1 :
		TextoTeclado.visible = true
		await TextoTeclado.iniciarAnimation()
		TextoTeclado.visible = false


