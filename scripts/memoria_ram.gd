extends Area2D

func _on_body_entered(_body):
	queue_free()
	var coins = get_tree().get_nodes_in_group("memoriaRam")
	if coins.size() == 1 :
		Textomemoria.visible = true
		await Textomemoria.iniciarAnimation()
		Textomemoria.visible = false
		#Events.level_completed.emit()
		

