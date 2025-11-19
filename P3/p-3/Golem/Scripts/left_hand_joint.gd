extends animatedPart

# Movement variables
var to_front := false
var to_back := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)

func _resetAnimation():
	to_front = false
	to_back = true
	super._resetAnimation()

func armAnimation(delta: float):
	if to_front:
		rotation.x += deg_to_rad(rotation_speed_deg * delta)
		if (rad_to_deg(rotation.x) >= 60):
			to_front = false
			to_back = true
	if to_back:
		rotation.x -= deg_to_rad(rotation_speed_deg * delta)
		if (rad_to_deg(rotation.x) <= -20):
			to_front = true
			to_back = false
