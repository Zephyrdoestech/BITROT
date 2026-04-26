extends Node2D

@onready var platform = $Platform
@onready var firewall = $Firewall
@onready var death_floor = $DeathFloor
@onready var shoot1 = $Flameshot
@onready var shoot2 = $Flameshot2

func _ready() -> void:
	GameManager.respawn_point = $StartMarker.global_position
	GameManager.current_level = "res://Scenes/Levels/Level_3.tscn"
	CodingWindow.option_selected.connect(_on_option_selected)

func _on_option_selected(bubble_id: int, index: int, is_toggled: bool) -> void:
	match bubble_id:
		0: 
			match index:
				0:
					if is_toggled:
						disableSecurity()
					else:
						enableSecurity()
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
		1: 
			match index:
				0:
					if is_toggled:
						raiser_platform(death_floor)
					else:
						lowerer_platform(death_floor)
				1:
					if is_toggled:
						death_floor.disable()
					else:
						death_floor.disable()
				2:
					if is_toggled:
						hide_platform(death_floor)
					else:
						show_platform(death_floor)
		2: 
			match index:
				0:
					if is_toggled:
						hide_platform(death_floor)
					else:
						show_platform(death_floor)
				1:
					if is_toggled:
						shoot1.slow_down()
					else:
						shoot1.speed_up()
				2:
					if is_toggled:
						shoot2.slow_down()
					else:
						shoot2.speed_up()

func enableSecurity() -> void:
	firewall.get_node("CollisionShape2D").disabled = false
	firewall.visible = true

func disableSecurity() -> void:
	firewall.get_node("CollisionShape2D").disabled = true
	firewall.visible = false

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
