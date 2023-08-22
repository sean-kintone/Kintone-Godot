extends Control

@onready var score = $label/score

var playerScore = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_player_hit():
	playerScore += 10
	score.text = str(playerScore)
