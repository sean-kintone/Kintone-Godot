extends CharacterBody2D

@onready var collision_shape_2d = $CollisionShape2D

@export var enemySpeed : int = 100
var direction : Vector2 = Vector2(0, 1)

func get_input():
	velocity = direction * enemySpeed

func _physics_process(delta):
	get_input()
	move_and_slide()
