extends Camera3D
func _ready() -> void:
	position = Vector3(1.5, 1.5, 2)
	look_at( Vector3(0, 0, 0), Vector3.UP)
