extends Area2D

@export var option_1: String = "Option 1"
@export var option_2: String = "Option 2"
@export var option_3: String = "Option 3"

var player_nearby: bool = false

func _ready() -> void:
	$InteractPrompt.visible = false
	print("bubble ready")

func _process(_delta) -> void:
	if player_nearby:
		print("player nearby, waiting for E")
	if player_nearby and Input.is_action_just_pressed("interact"):
		print("interacted!")
		GameManager.pause_game()
		CodingWindow.open([option_1, option_2, option_3])

func _on_body_entered(body: Node2D) -> void:
	print("something entered: ", body.name)
	if body.name == "Player":
		player_nearby = true
		$InteractPrompt.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = false
		$InteractPrompt.visible = false
