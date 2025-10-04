extends Node3D

@onready var torso: TorsoHolder = $Torso
@onready var left_arm: LimbHolder = $LeftArm
@onready var right_arm: LimbHolder = $RightArm
@onready var left_leg: LimbHolder = $LeftLeg
@onready var right_leg: LimbHolder = $RightLeg
@onready var head: LimbHolder = $Head
@onready var limb_holders : Array[LimbHolder] = [left_arm, right_arm, left_leg, right_leg, head]

var positions : Dictionary[String, Vector3]

func _ready() -> void:
	torso.connect("instancing_new_torso", _on_new_torso_part_instanced)
	for holder in limb_holders:
		holder.connect("instancing_new_limb", _on_new_limb_part_instanced)

func _on_new_torso_part_instanced(new_torso : Torso):
	positions = new_torso.get_limb_positions()
	left_arm.position = positions.get("LeftArm")
	right_arm.position = positions.get("RightArm")
	left_leg.position = positions.get("LeftLeg")
	right_leg.position = positions.get("RightLeg")
	head.position = positions.get("Head")

@warning_ignore("unused_parameter")
func _on_new_limb_part_instanced(new_limb : Limb):
	pass
