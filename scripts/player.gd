extends CharacterBody2D

@export var movement_data : PlayerMovementData

var air_jump = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var starting_position = global_position
func _physics_process(_delta):
	# Add the gravity.
	apply_gravity(_delta)

	# Handle Jump.
	handle_jump()
	
	var input_axis = Input.get_axis("izquierda", "derecha")
	
	#Hacemos el llamado a la función de acceleración
	handle_acceleration(input_axis, _delta)
	
	handle_air_acceleration(input_axis, _delta)
	
	#Hacemos el llamado a la función de fricción
	apply_friction(input_axis, _delta)
	
	animation_update(input_axis)
	move_and_slide()
	
#Funcion para aplicar la gravedad al objeto
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * movement_data.gravity_scale * delta
#Funcion para el salto
func handle_jump():
	if is_on_floor(): air_jump = true
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = movement_data.jump_velocity
	else:
		if Input.is_action_just_pressed("ui_accept") and velocity.y < movement_data.jump_velocity / 2:
			velocity.y = movement_data.jump_velocity / 2
			
		if Input.is_action_just_pressed("ui_accept") and air_jump:
			velocity.y = movement_data.jump_velocity * 0.8
			air_jump = false
#Función para la friccion del objeto con el suelo
func apply_friction(input_axis, delta):
	if input_axis == 0 and  is_on_floor():
		velocity.x = move_toward(velocity.x, 0, movement_data.friction * delta)
func apply_air_reistance(input_axis, _delta):
	if input_axis == 0 and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, movement_data.air_resistence)
#Funcion de acelaración para el objeto
func handle_acceleration(input_axis, delta):
	if not is_on_floor(): return
	if input_axis !=0:
		velocity.x = move_toward(velocity.x, movement_data.speed * input_axis, movement_data.acceleration * delta)
func handle_air_acceleration(input_axis, delta):
	if is_on_floor(): return
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, movement_data.speed * input_axis, movement_data.air_acceleration * delta)
func animation_update(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
		
	if not is_on_floor():
		animated_sprite_2d.play("jump")

func _on_hazard_detector_area_entered(_area):
	
	global_position = starting_position

