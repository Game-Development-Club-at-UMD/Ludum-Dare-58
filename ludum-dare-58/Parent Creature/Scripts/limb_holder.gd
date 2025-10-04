class_name LimbHolder extends BaseBodyPartHolder

## Triggers when a new limb is instanced under this node
signal instancing_new_limb(new_limb : BaseBodyPart)


func set_body_part(new_part : PackedScene):
	var instanced_part = new_part.instantiate() as Limb
	add_child(instanced_part)
	#instanced_part.position = Vector3(0, 0, 0)
	instanced_part.global_position = global_position
	
	#if !instanced_part.is_class("Limb"):
		#push_error("Error in node ", name, ": Attempted to set node of type ", instanced_part.get_class(), " to limb body part.")
		#return null
	
	body_part = instanced_part
	instancing_new_limb.emit(body_part)

func get_body_part() -> BaseBodyPart:
	return body_part
