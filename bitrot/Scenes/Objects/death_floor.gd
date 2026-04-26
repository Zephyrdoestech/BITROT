extends StaticBody2D

var is_active: bool = true

func _ready() -> void:
	$Area2D.body_entered.connect(_on_body_entered)
	update_visual()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and is_active:
		GameManager.restart_level()

func enable() -> void:
	is_active = true
	$Area2D/CollisionShape2D.disabled = false  # killing is on
	update_visual()

func disable() -> void:
	is_active = false
	$Area2D/CollisionShape2D.disabled = true   # killing is off, but still solid
	update_visual()

func update_visual() -> void:
	if is_active:
		modulate = Color(1, 0, 0, 0.8)   # red = dangerous
	else:
		modulate = Color(0, 1, 0, 0.5)   # green = safe to walk on
