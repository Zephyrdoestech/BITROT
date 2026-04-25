extends Node2D

@onready var high_platform = $HighPlatform  # path to your platform node

func _ready() -> void:
	GameManager.respawn_point = $StartMarker.global_position
	GameManager.current_level = "res://Scenes/Levels/Level_1.tscn"
	CodingWindow.option_selected.connect(_on_option_selected)

func _on_option_selected(index: int, is_toggled: bool) -> void:
	match index:
		0:
			if is_toggled:
				lower_platform()
			else:
				raise_platform()
		1:
			if is_toggled:
				print("Option 2 selected")
				#open_door()
			else:
				print("Option 2 selected")
				#close_door()
		2:
			if is_toggled:
				print("Option 3 selected")
				#turn_on_light()
			else:
				print("Option 3 selected")
				#turn_off_light()

func lower_platform() -> void:
	var tween = create_tween()
	tween.tween_property(high_platform, "position:y", high_platform.position.y + 160, 1.0)

func raise_platform() -> void:
	var tween = create_tween()
	tween.tween_property(high_platform, "position:y", high_platform.position.y - 160, 1.0)
