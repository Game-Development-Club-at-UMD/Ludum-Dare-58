class_name TorsoHolder extends BaseBodyPartHolder

signal instancing_new_torso(new_torso : Torso)

func set_body_part(new_part : PackedScene):
	var instanced_part = new_part.instantiate()
	
	if !instanced_part.is_class("Torso"):
		push_error("Error in node '%s': Attempted to set node of type ", new_part.get_class(), " to torso body part.")
		return null
	
	body_part = instanced_part
	instancing_new_torso.emit(body_part)

func get_body_part() -> BaseBodyPart:
	return body_part
