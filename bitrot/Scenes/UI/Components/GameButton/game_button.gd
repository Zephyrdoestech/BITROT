@tool
class_name GameButton
extends Button

@export_group("Transitions", "transition_")
@export var transition_scene_key: String = ""

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed():
	if (!transition_scene_key.strip_edges().is_empty()):
		SceneManager.load_scene(transition_scene_key)
	pass
