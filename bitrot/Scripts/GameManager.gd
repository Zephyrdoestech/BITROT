# GameManager.gd
extends Node

# ── RESPAWN ──────────────────────────────────────────────
var respawn_point: Vector2 = Vector2(100, 300)

# ── LEVEL STATE ──────────────────────────────────────────
var current_level: String = "res://Scenes/Levels/TestLevel.tscn"
var is_game_paused: bool = false

# ── PLAYER REFERENCE ─────────────────────────────────────
var player: CharacterBody2D = null

func register_player(p: CharacterBody2D) -> void:
	player = p

# ── RESPAWN LOGIC ─────────────────────────────────────────
func respawn_player() -> void:
	CodingWindow.reset()  # ← add this too
	if player:
		player.global_position = respawn_point
		player.velocity = Vector2.ZERO

# ── LEVEL MANAGEMENT ──────────────────────────────────────
func load_level(path: String) -> void:
	current_level = path
	get_tree().change_scene_to_file(path)

func restart_level() -> void:
	print("restarting level")
	CodingWindow.reset()
	get_tree().reload_current_scene()

# ── PAUSE ─────────────────────────────────────────────────
func pause_game() -> void:
	is_game_paused = true
	get_tree().paused = true

func resume_game() -> void:
	is_game_paused = false
	get_tree().paused = false
