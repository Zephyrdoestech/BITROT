extends Area2D

var speed: float = 300.0
var max_distance: float = 500.0
var start_x: float = 0.0

func _ready() -> void:
	start_x = global_position.x
	body_entered.connect(_on_body_entered)

func _process(delta) -> void:
	# move left
	position.x -= speed * delta

	# check if travelled max distance
	if abs(global_position.x - start_x) >= max_distance:
		queue_free()  # disappears

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		GameManager.restart_level()
		queue_free()
