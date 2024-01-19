extends Node2D

#Instanciamos el nodo de button utilizado para empezar le juego
@onready var start_game_button = %StartGameButton



func _ready():
	start_game_button.grab_focus()
	pass

func _on_start_game_button_pressed():
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_file("res://scene/mundos/tutorial.tscn")
	LevelTransition.fade_from_black()


func _on_quit_button_pressed():
	get_tree().quit()
