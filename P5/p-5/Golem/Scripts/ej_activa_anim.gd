extends Node3D

@export var rotation_speed_deg := 10.0  # grados por segundo
@export var activar := "activar_cabeza"
var activa := true

func _process(delta):
	if Input.is_action_just_pressed(activar):
		activa = !activa
		print(activa)
	if activa:
		# Rotación continua en Y
		rotate_y(deg_to_rad(rotation_speed_deg * delta))
