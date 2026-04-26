extends StaticBody2D

@export var dissolve_time: float = 0.5
var timer: float = 0.0
var is_dissolving: bool = false

func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _physics_process(delta) -> void:
	if is_dissolving:
		timer += delta
		if timer >= dissolve_time - 0.5:
			visible = !visible if Engine.get_frames_drawn() % 10 == 0 else visible
		if timer >= dissolve_time:
			hide_platform()

func _on_body_entered(body: Node2D) -> void:
	print("something entered: ", body.name)
	if body.is_in_group("player"):
		is_dissolving = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		is_dissolving = false
		timer = 0.0

func hide_platform() -> void:
	visible = false
	$CollisionShape2D.disabled = true
