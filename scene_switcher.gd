extends Node

var current_scene: Node = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

func goto_scene(scene_path):
	call_deferred("_deferred_goto_scene", scene_path)
	
func _deferred_goto_scene(schene_path):
	print("_deferred_goto_scene: ", schene_path)
	
	current_scene.free()

	var scene_resource: PackedScene = ResourceLoader.load(schene_path)
	
	current_scene = scene_resource.instantiate()
	
	get_tree().root.add_child(current_scene)
	
	get_tree().current_scene = current_scene
