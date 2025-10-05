extends Node3D
const PARENT_CREATURE = preload("uid://dr6x0l7rc5yuk")

var enemy : ParentCreature
@onready var enemy_holder: Node3D = $EnemyHolder

@export var player_controller : PlayerController

func _ready() -> void:
	player_controller.connect('player_action', _on_player_clicked_node)

func _process(_delta: float) -> void:
	if Input.is_action_just_released("ui_accept"):
		debug()

func instance_new_enemy(new_enemy : PackedScene):
	var instanced_enemy = new_enemy.instantiate()
	
	if !instanced_enemy is ParentCreature:
		push_error("Error in node ", name, ": Attempted to instance node of type ", instanced_enemy.get_class())
		instanced_enemy.queue_free()
		return null
	
	#TODO: fix enemy spawning in at the correct position/rotation
	enemy_holder.add_child(instanced_enemy)
	instanced_enemy.global_transform = enemy_holder.global_transform
	
	
	if enemy != null:
		enemy.queue_free()
	enemy = instanced_enemy
	enemy.global_transform = enemy_holder.global_transform

@warning_ignore("unused_parameter")
func _on_player_clicked_node(node_clicked : Node):
	if node_clicked.name == "Cauldron":
		print("cauldron clicked")
	if node_clicked is not BaseBodyPart:
		return
	
	#TODO: initiate part constructor here


func debug():
	# initialize an enemy to pass instance in the ACTUAL instance method
	var debug_enemy : Node = PARENT_CREATURE.instantiate()
	
	# just adding the creature to the scene tree
	get_tree().root.add_child(debug_enemy)
	#debug_enemy.visible = false
	
	# initializing all body parts with values
	debug_enemy.torso.set_body_part(load("res://Limb Scenes/Scenes/DebugTorso.tscn"))
	for holder in debug_enemy.limb_holders:
		if holder.name != "Head":
			holder.set_body_part(load("res://Limb Scenes/Scenes/DebugLimb.tscn"))
		else:
			holder.set_body_part(load("res://Limb Scenes/Scenes/DebugHead.tscn"))
	
	# compressing scene back into a PackedScene
	##WE HAVE TO DECLARE THE NEW PACKED SCENE AND THEN PACK IT ON A SEPARATE LINE !!!
	##INCORRECT: var packed_enemy = PackedScene.new().pack(debug_enemy)
	## ^ if you do this on the same line, the function .pack() returns an Error object into the packed_enemy variable
	var packed_enemy : PackedScene = PackedScene.new()
	packed_enemy.pack(debug_enemy)
	
	# passing debug packed scene to the ACTUAL instancer
	instance_new_enemy(packed_enemy)
	
