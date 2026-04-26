extends Node2D

@onready var platform = $Platform

func _ready() -> void:
	GameManager.respawn_point = $StartMarker.global_position
	GameManager.current_level = "res://Scenes/Levels/Level_2.tscn"
	CodingWindow.option_selected.connect(_on_option_selected)

func _on_option_selected(bubble_id: int, index: int, is_toggled: bool) -> void:
	match bubble_id:
		0:  # Bubble 1 controls platform_1
			match index:
				0:
					if is_toggled:
						show_blocked_message()
				1:
					if is_toggled:
						lowerer_platform(platform)
					else:
						raiser_platform(platform)
				2:
					if is_toggled:
						hide_platform(platform)
					else:
						show_platform(platform)

func lower_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y + 150, 0.3)

func raise_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y - 150, 0.3)

func lowerer_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y + 400, 0.5)

func raiser_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y - 400, 0.5)
	
func hide_platform(platform: Node2D) -> void:
	platform.visible = false
	platform.get_node("CollisionShape2D").disabled = true

func show_platform(platform: Node2D) -> void:
	platform.visible = true
	platform.get_node("CollisionShape2D").disabled = false

func show_blocked_message() -> void:
	CodingWindow.show_blocked()
