extends Node

@export var scene_list: Array[SceneData]
var scene_dict = {}
var current_scene: SceneData = null;

func _ready():
	for data in scene_list:
		scene_dict[data.key] = data

func load_scene(key: String):
	var sd = scene_dict[key] as SceneData;
	current_scene = sd;
	if sd is LevelData:
		sd = scene_dict["game_level"];
	get_tree().change_scene_to_packed(sd.scene);
