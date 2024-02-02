extends ProgressBar


var maxvalor : int

func _ready():
	maxvalor = 100

func disminuirvida(damage):
	value -= damage
	if value <= 0:
		get_tree().get_nodes_in_group("jugador")[0].dead()
