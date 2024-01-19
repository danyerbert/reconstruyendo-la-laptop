extends Node2D

@onready var enemigo_pez = $pez

func _ready():
	enemigo_pez.play("nadar")
