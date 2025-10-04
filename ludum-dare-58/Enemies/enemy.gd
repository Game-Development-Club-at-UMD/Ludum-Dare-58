extends Node3D

@onready var creature = $ParentCreature

var limb_scenes: Array

func _ready() -> void:
	limb_scenes = get_scenes_in_directory("res://Limb Scenes/Scenes/")
	generate_enemy()

func generate_enemy():
	print(limb_scenes)
	print(get_random_limb_scene("LEGS"))
	for holder in creature.limb_holders:
		if holder.name.find("Leg"):
			holder.set_body_part(get_random_limb_scene("LEGS"))
		elif holder.name.find("Arm"):
			holder.set_body_part(get_random_limb_scene("ARMS"))
		elif holder.name.find("Head"):
			holder.set_body_part(get_random_limb_scene("HEAD"))
		if holder.name.find("Torso"):
			holder.set_body_part(get_random_limb_scene("TORSO"))
		
		print(creature.limb_holders, get_random_limb_scene("HEAD"))
		

func get_random_limb_scene(oftype = null):
	for limb_scene in limb_scenes:
		var tscn = load(limb_scene).instantiate()
		if tscn.body_part_resource.limb == oftype:
			print(tscn, oftype)
			return load(limb_scene)

func get_scenes_in_directory(path: String) -> Array:
	var scenes: Array
	var dir = DirAccess.open(path)

	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir():
				if file_name.ends_with(".tscn"):
					scenes.append(path.path_join(file_name))
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("Could not open directory: %s" % path)
	return scenes
