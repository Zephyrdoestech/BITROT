extends Node2D

func _ready() -> void:
	GameManager.respawn_point = $StartMarker.global_position
	GameManager.current_level = "res://Scenes/Levels/Level_2.tscn"
