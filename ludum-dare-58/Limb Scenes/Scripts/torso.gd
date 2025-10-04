class_name Torso extends BaseBodyPart

@export var left_arm : Marker3D
@export var right_arm : Marker3D
@export var left_leg : Marker3D
@export var right_leg : Marker3D
@export var head : Marker3D

func get_limb_positions() -> Dictionary:
	return {
		"LeftArm": left_arm.position,
		"RightArm": right_arm.position,
		"LeftLeg": left_leg.position,
		"RightLeg": right_leg.position,
		"Head": head.position
	}
