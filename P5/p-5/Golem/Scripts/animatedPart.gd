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

@onready var emisor = get_node("/root/EscenaPrincipal/Camera3DOrbital")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emisor.moveHead.connect(_activateHead)
	#print(emisor)

func _activateHead():
	headActive = !headActive
	_resetAnimation()
	walkActive = false
	armActive = false
	legActive = false
	allActive = false

func _activateWalk():
	walkActive = !walkActive
	_resetAnimation()
	armActive = false
	legActive = false
	headActive = false
	allActive = false
	
func _activateArms():
	armActive = !armActive
	_resetAnimation()
	walkActive = false
	legActive = false
	headActive = false
	allActive = false
	
func _activateLegs():
	legActive = !legActive
	_resetAnimation()
	walkActive = false
	armActive = false
	headActive = false
	allActive = false
	
func _activateAll():
	allActive = !allActive
	_resetAnimation()
	walkActive = false
	armActive = false
	legActive = false
	headActive = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Input.is_action_just_pressed(walkAnimation):
		_activateWalk()
	if walkActive :
		walkingAnimation(delta)
		headAnimation(delta)
	
	if Input.is_action_just_pressed(moveArm):
		_activateArms()
	if armActive:
		armAnimation(delta)
	
	if Input.is_action_just_pressed(moveLeg):
		_activateLegs()
	if legActive:
		legAnimation(delta)
		
	if Input.is_action_just_pressed(moveHead):
		_activateHead()
	if headActive:
		headAnimation(delta)
	
	if Input.is_action_just_pressed(moveAll):
		_activateAll()
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
