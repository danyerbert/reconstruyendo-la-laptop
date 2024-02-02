extends Area2D

func _on_body_entered(body):
	queue_free()
	var coins = get_tree().get_nodes_in_group("carcasa")
	if coins.size() == 1 :
		Carcasas.visible = true
		await Carcasas.iniciarAnimation()
		Carcasas.visible = false
