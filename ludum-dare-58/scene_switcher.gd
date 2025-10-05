extends Node

var packed_player_scene : PackedScene
var packed_enemy_scene : PackedScene

func _ready() -> void:
	#TODO: remove debug init loading
	save_player_scene(load("uid://dr6x0l7rc5yuk").instantiate())
	save_enemy_scene(load("uid://dr6x0l7rc5yuk").instantiate())


## TODO: typecast player to PlayerCreature
func save_player_scene(player : ParentCreature):
	var new_packed_scene : PackedScene = PackedScene.new()
	new_packed_scene.pack(player)
	packed_player_scene = new_packed_scene

func get_player_scene() -> PackedScene:
	return packed_player_scene

func get_enemy_scene() -> PackedScene:
	return packed_enemy_scene

## TODO: typecast enemy to EnemyCreature
func save_enemy_scene(enemy : ParentCreature):
	var new_packed_scene : PackedScene = PackedScene.new()
	new_packed_scene.pack(enemy)
	packed_enemy_scene = new_packed_scene

func switch_scene(scene_path : String):
	#method 1: scenes switch with a bit of a load delay
	#var old_scene = get_tree().current_scene
	#get_tree().change_scene_to_file(scene_path)
	#old_scene.queue_free()
	# method 2: scenes switch without waiting for load
	if !FileAccess.file_exists(scene_path):
		push_error("Error in SceneSwitcher, file does not exist at ", scene_path)
	var old_scene = get_tree().current_scene
	var new_scene = load(scene_path).instantiate()
	get_tree().root.add_child(new_scene)
	new_scene.owner = get_tree().root
	old_scene.queue_free()
	get_tree().current_scene = new_scene
