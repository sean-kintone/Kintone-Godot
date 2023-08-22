extends CharacterBody2D

@export var speed :int = 600
@export var bulletSpeed : int = 200
@onready var animation_player = $AnimationPlayer

signal died

enum States {IDLE, LEFT, RIGHT, SHOOT, DIE}
@export var currentState : int = States.IDLE

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	match input_direction:
		Vector2(-1, 0):
			currentState = States.LEFT
		Vector2(1, 0):
			currentState = States.RIGHT
		_:
			currentState = States.IDLE

func _physics_process(delta):
	get_input()
	chooseAnimation()
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	move_and_slide()

func chooseAnimation():
	if currentState == States.LEFT:
		animation_player.play("left")
	elif currentState == States.RIGHT:
		animation_player.play("right")
	else:
		animation_player.play("idle")

func shoot():
	pass

func die():
	died.emit()
	queue_free()
