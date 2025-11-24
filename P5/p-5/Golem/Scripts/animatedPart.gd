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

# Posible States ===========================
enum State { none, WALK, ARM, LEG, HEAD, ALL }
var current_state = State.none

@onready var emisor = get_node("/root/EscenaPrincipal/Camera3DOrbital")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emisor.moveHead.connect(_activateHead)
	#print(emisor)

func _activateHead():
	_resetAnimation()
	current_state = State.HEAD

func _activateWalk():
	_resetAnimation()
	current_state = State.WALK
	
func _activateArms():
	_resetAnimation()
	current_state = State.ARM
	
func _activateLegs():
	_resetAnimation()
	current_state = State.LEG
	
func _activateAll():
	_resetAnimation()
	current_state = State.ALL
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed(walkAnimation):
		_activateWalk()
		
	elif Input.is_action_just_pressed(moveArm):
		_activateArms()
		
	elif Input.is_action_just_pressed(moveLeg):
		_activateLegs()
		
	elif Input.is_action_just_pressed(moveHead):
		_activateHead()
		
	elif Input.is_action_just_pressed(moveAll):
		_activateAll()
	
	match current_state:
		State.WALK:
			walkingAnimation(delta)
			headAnimation(delta)
		State.ARM:
			armAnimation(delta)
		State.LEG:
			legAnimation(delta)
		State.HEAD:
			headAnimation(delta)
		State.ALL:
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
