class_name GenericBodyPart
extends Resource

@export var move : Move

@export var bodyPartModel : PackedScene


func getMove() -> Move:
	return move


func getModel() -> PackedScene:
	return bodyPartModel
