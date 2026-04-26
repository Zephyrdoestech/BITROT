extends Node2D

@export var shoot_interval: float = 2.0  # time between shots
@export var projectile_speed: float = 300.0
@export var max_distance: float = 500.0  # how far before it disappears
const PROJECTILE = preload("res://Scenes/Objects/flame.tscn")

func _ready() -> void:
	$Timer.wait_time = shoot_interval
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start()
	_shoot()  # shoot immediately on start

func _on_timer_timeout() -> void:
	_shoot()

func _shoot() -> void:
	var projectile = PROJECTILE.instantiate()
	projectile.speed = projectile_speed
	projectile.max_distance = max_distance
	projectile.global_position = global_position
	get_parent().add_child(projectile)

func slow_down() -> void:
	$Timer.wait_time = shoot_interval * 2.0

func speed_up() -> void:
	$Timer.wait_time = shoot_interval * 0.5

func reset() -> void:
	$Timer.wait_time = shoot_interval
