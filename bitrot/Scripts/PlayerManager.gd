# PlayerManager.gd
extends Node

var current_player: CharacterBody2D = null
var inventory: Array = []
var stats: Dictionary = {
	"health": 100,
	"max_health": 100,
}

func register_player(player: CharacterBody2D) -> void:
	current_player = player
