extends Node2D

@onready var platform = $Platform
@onready var platform2 = $Platform2
@onready var platform3 = $Platform3
@onready var platform4 = $Platform4
@onready var firewall = $Firewall

func _ready() -> void:
	GameManager.respawn_point = $StartMarker.global_position
	GameManager.current_level = "res://Scenes/Levels/Level_1.tscn"
	CodingWindow.option_selected.connect(_on_option_selected)

func _on_option_selected(bubble_id: int, index: int, is_toggled: bool) -> void:
	match bubble_id:
		0:  # Bubble 1 controls platform_1
			match index:
				0:
					if is_toggled:
						hide_platform(platform)
					else:
						show_platform(platform)
				1:
					if is_toggled:
						move_platform_right(platform)
					else:
						move_platform_left(platform)
				2:
					if is_toggled:
						lower_platform(platform)
					else:
						raise_platform(platform)
		1:  # Bubble 2 controls platform_2
			match index:
				0:
					if is_toggled:
						hide_platform(platform2)
					else:
						show_platform(platform2)
				1:
					if is_toggled:
						move_platform_left(platform2)
					else:
						move_platform_right(platform2)
				2:
					if is_toggled:
						lower_platform(platform2)
					else:
						raise_platform(platform2)
		2: 
			match index:
				0:
					if is_toggled:
						hide_platform(platform3)
					else:
						show_platform(platform3)
				1:
					if is_toggled:
						move_platform_left(platform3)
					else:
						move_platform_right(platform3)
				2:
					if is_toggled:
						lowerer_platform(platform3)
					else:
						raiser_platform(platform3)
		3: 
			match index:
				0:
					if is_toggled:
						disableSecurity()
					else:
						enableSecurity()
				1:
					if is_toggled:
						move_platform_lefter(platform4)
					else:
						move_platform_righter(platform4)
				2:
					if is_toggled:
						hide_platform(platform4)
					else:
						show_platform(platform4)

func lower_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y + 150, 0.3)

func raise_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y - 150, 0.3)
	
func lowerer_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y + 200, 1.5)

func raiser_platform(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:y", platform.position.y - 200, 1.5)

func move_platform_left(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:x", platform.position.x - 100, 1.0)

func move_platform_right(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:x", platform.position.x + 100, 1.0)

func move_platform_lefter(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:x", platform.position.x - 150, 1.0)

func move_platform_righter(platform: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property(platform, "position:x", platform.position.x + 150, 1.0)

func hide_platform(platform: Node2D) -> void:
	platform.visible = false
	platform.get_node("CollisionShape2D").disabled = true

func show_platform(platform: Node2D) -> void:
	platform.visible = true
	platform.get_node("CollisionShape2D").disabled = false

func enableSecurity() -> void:
	firewall.get_node("CollisionShape2D").disabled = false
	firewall.visible = true

func disableSecurity() -> void:
	firewall.get_node("CollisionShape2D").disabled = true
	firewall.visible = false
