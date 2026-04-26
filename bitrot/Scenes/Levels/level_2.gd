extends Node2D

@onready var platform = $Platform
@onready var platform2 = $Platform2
@onready var platform3 = $Platform3
@onready var platform4 = $Platform4
@onready var spike2 = $FallingSpike2
@onready var spike3 = $FallingSpike3
@onready var spike4 = $FallingSpike4


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
		1:  
			match index:
				0:  
					toggle_platform(platform)
					toggle_platform(platform3)
				1:  
					toggle_platform(platform)
					toggle_platform(platform2)
					toggle_platform(platform3)
				2:  
					toggle_platform(platform)
					toggle_platform(platform2)
		2: 
			match index:
				0:
					if is_toggled:
						spike2.slow_down()
					else:
						spike2.speed_up()
				1:
					if is_toggled:
						spike3.slow_down()
					else:
						spike3.speed_up()
				2:
					if is_toggled:
						spike4.slow_down()
					else:
						spike4.speed_up()
func _create_tween():
	var tween = create_tween();
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	return tween;

func lower_platform(platform: Platform) -> void:
	var tween = _create_tween()
	tween.tween_property(platform, "position:y", platform.original_position.y + 150, 0.3)

func raise_platform(platform: Platform) -> void:
	var tween = _create_tween()
	tween.tween_property(platform, "position:y", platform.original_position.y, 0.3)
	
func lowerer_platform(platform: Platform) -> void:
	var tween = _create_tween()
	tween.tween_property(platform, "position:y", platform.original_position.y + 200, 1.5)

func raiser_platform(platform: Platform) -> void:
	var tween = _create_tween()
	tween.tween_property(platform, "position:y", platform.original_position.y, 1.5)

func hide_platform(platform: Node2D) -> void:
	platform.visible = false
	platform.get_node("CollisionShape2D").disabled = true

func show_platform(platform: Node2D) -> void:
	platform.visible = true
	platform.get_node("CollisionShape2D").disabled = false

func show_blocked_message() -> void:
	CodingWindow.show_blocked()

func toggle_platform(target: Node2D) -> void:
	if target.visible:
		hide_platform(target)
	else:
		show_platform(target)
