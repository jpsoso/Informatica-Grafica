extends animatedPart

# Movement variables
var to_up := false
var to_down := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	super._process(delta)

func _resetAnimation():
	to_up = false
	to_down = true
	super._resetAnimation()

func headAnimation(delta: float):
	if to_up:
		position.y +=  delta / 5
		if (position.y >= 1.9):
			to_up = false
			to_down = true
	if to_down:
		position.y -=  delta / 5
		if (position.y <= 1.782):
			to_down = false
			to_up = true
