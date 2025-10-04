extends Node3D
const PARENT_CREATURE = preload("uid://dr6x0l7rc5yuk")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_released("ui_accept"):
		debug()


func debug():
	var enemy = PARENT_CREATURE.instantiate()
	add_child(enemy)
	enemy.global_position = global_position
	enemy.torso.set_body_part(load("res://Limb Scenes/Scenes/DebugTorso.tscn"))
	for holder in enemy.limb_holders:
		if holder.name != "Head":
			holder.set_body_part(load("res://Limb Scenes/Scenes/DebugLimb.tscn"))
		else:
			holder.set_body_part(load("res://Limb Scenes/Scenes/DebugHead.tscn"))
