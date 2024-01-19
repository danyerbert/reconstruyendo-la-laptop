extends ColorRect

signal retry()
signal next_level()

@onready var retry_button = %RetryButton
@onready var next_level_button = %NextLevelButton
#Nos conectamos a la señales que generan los botones a la hora de presionar
func _on_retry_button_pressed():
	#print("Intentalo de nuevo")
	retry.emit()

func _on_next_level_button_pressed():
	#print("Siguiente Nivel")
	next_level.emit()
