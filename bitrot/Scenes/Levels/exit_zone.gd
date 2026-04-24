extends Area2D

@export var next_level: String = "res://Scenes/Levels/Level_2.tscn"

func _on_body_entered(body: Node2D) -> void:
	print("exit hit: ", body.name)
	if body.name == "Player":
		print("loading: ", next_level)
		GameManager.load_level(next_level)
