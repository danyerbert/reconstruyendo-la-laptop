extends Area2D

func _on_body_entered(_body):
	queue_free()
	var coins = get_tree().get_nodes_in_group("destonillador")
	if coins.size() == 1:
		Events.level_completed.emit()
