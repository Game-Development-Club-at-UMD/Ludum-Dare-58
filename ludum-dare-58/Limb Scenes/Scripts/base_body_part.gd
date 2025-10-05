class_name BaseBodyPart extends Node3D

## Body part resource to store moveset data, health, and damage
@export var body_part_resource : BodyPartResource
## Mesh for the specific body part
@export var mesh_instance_3d: MeshInstance3D

## Returns the local BodyPartResource
func get_body_part_resource(): return body_part_resource

## Returns the mesh for the body part
func get_mesh_instance_3d(): return mesh_instance_3d
