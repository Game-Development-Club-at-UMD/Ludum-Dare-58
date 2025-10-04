class_name TorsoHolder extends BaseBodyPartHolder

## Triggers when a new torso is instanced under this node
signal instancing_new_torso(new_torso : Torso)

func set_body_part(new_part : PackedScene):
	var instanced_part = new_part.instantiate() as Torso
	add_child(instanced_part)
	#instanced_part.position = Vector3(0, 0, 0)
	instanced_part.global_position = global_position
	
	#if !instanced_part.is_class("Torso"):
		#push_error("Error in node ", name, ": Attempted to set node of type ", instanced_part.get_class(), " to torso body part.")
		#return null
	
	body_part = instanced_part as BaseBodyPart
	instancing_new_torso.emit(body_part)

func get_body_part() -> BaseBodyPart:
	return body_part
