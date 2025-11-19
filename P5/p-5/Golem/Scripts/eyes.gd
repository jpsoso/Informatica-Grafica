extends animatedPart

# Movement variables
var increasing := false
var decreasing := true

# Increasing/decreasing speed
var sizingSpeed = 0.01

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)

func _resetAnimation():
	increasing = false
	decreasing = true
	super._resetAnimation()

func headAnimation(delta: float):
	if increasing:
		scale.y += sizingSpeed 
		if (scale.y >= 1):
			increasing = false
			decreasing = true
	if decreasing:
		scale.y -= sizingSpeed
		if (scale.y <= 0):
			increasing = true
			decreasing = false
