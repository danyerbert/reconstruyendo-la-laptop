extends Area2D


func _on_body_entered(_body):
	queue_free()
	var coins = get_tree().get_nodes_in_group("discoDuro")
	if coins.size() == 1 :
		TextoDiscoDuro.visible = true
		await TextoDiscoDuro.iniciarAnimation()
		TextoDiscoDuro.visible = false
		#Events.level_completed.emit()


