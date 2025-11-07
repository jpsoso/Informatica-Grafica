class_name animatedPart extends Node3D

@export var walkAnimation := "walk"
var walkActive := false

@export var moveArm := "MoveArm"
var armActive := false

@export var moveLeg := "MoveLeg"
var legActive := false

@export var moveHead := "MoveHead"
var headActive := false

@export var moveAll := "MoveAll"
var allActive := false

var angle := 0.0
var rotation_speed_deg := 100
var translation_speed := 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(walkAnimation):
		walkActive = !walkActive
		_resetAnimation()
		armActive = false
		legActive = false
		headActive = false
		allActive = false
	if walkActive :
		walkingAnimation(delta)
		headAnimation(delta)
	
	if Input.is_action_just_pressed(moveArm):
		armActive = !armActive
		_resetAnimation()
		walkActive = false
		legActive = false
		headActive = false
		allActive = false
	if armActive:
		armAnimation(delta)
	
	if Input.is_action_just_pressed(moveLeg):
		legActive = !legActive
		_resetAnimation()
		walkActive = false
		armActive = false
		headActive = false
		allActive = false
	if legActive:
		legAnimation(delta)
		
	if Input.is_action_just_pressed(moveHead):
		headActive = !headActive
		_resetAnimation()
		walkActive = false
		armActive = false
		legActive = false
		allActive = false
	if headActive:
		headAnimation(delta)
	
	if Input.is_action_just_pressed(moveAll):
		allActive = !allActive
		_resetAnimation()
		walkActive = false
		armActive = false
		legActive = false
		headActive = false
	if allActive:
		armAnimation(delta)
		legAnimation(delta)
		headAnimation(delta)
	
func _resetAnimation():
	rotation.x = 0
	rotation.y = 0
	rotation.z = 0
	translate(Vector3(0,0,0))
	scale.x = 1
	scale.y = 1
	scale.z = 1

func walkingAnimation(delta: float):
	pass

func armAnimation(delta: float):
	pass
	
func legAnimation(delta: float):
	pass

func headAnimation(delta: float):
	pass
