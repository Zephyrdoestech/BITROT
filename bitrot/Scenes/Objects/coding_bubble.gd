extends Area2D

@export var option_1_default: String = "Lower Platform"
@export var option_1_toggled: String = "Raise Platform"
@export var option_2_default: String = "Open Door"
@export var option_2_toggled: String = "Close Door"
@export var option_3_default: String = "Turn On Light"
@export var option_3_toggled: String = "Turn Off Light"

var player_nearby: bool = false

func _ready() -> void:
	$InteractPrompt.visible = false

func _process(_delta) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		GameManager.pause_game()
		CodingWindow.open(
			[option_1_default, option_2_default, option_3_default],
			[option_1_toggled, option_2_toggled, option_3_toggled]
		)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = true
		$InteractPrompt.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = false
		$InteractPrompt.visible = false
