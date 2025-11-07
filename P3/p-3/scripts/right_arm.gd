extends animatedPart

# Movement variables
var to_front := true
var to_back := false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)

func _resetAnimation():
	to_front = true
	to_back = false
	super._resetAnimation()

func walkingAnimation(delta: float):
	if to_front:
		rotation.x -= deg_to_rad(rotation_speed_deg * delta)
		if (rad_to_deg(rotation.x) <= -45):
			to_front = false
			to_back = true
	if to_back:
		rotation.x += deg_to_rad(rotation_speed_deg * delta)
		if (rad_to_deg(rotation.x) >= 45):
			to_front = true
			to_back = false

func armAnimation(delta: float):
	rotation.x -= deg_to_rad(rotation_speed_deg * delta)
