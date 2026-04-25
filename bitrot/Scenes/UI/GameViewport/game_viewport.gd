extends Node2D

@export var sub_viewport: SubViewport;

func _ready() -> void:
	var level: SceneData = SceneManager.current_scene
	if (level != null and level is LevelData):
		var scene = level.scene.instantiate();
		
		var sv_children = sub_viewport.get_children();
		for c in sv_children:
			sub_viewport.remove_child(c)
			c.queue_free();
		sub_viewport.add_child(scene);
