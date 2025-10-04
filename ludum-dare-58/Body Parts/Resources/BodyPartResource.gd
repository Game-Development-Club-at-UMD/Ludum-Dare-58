class_name BodyPartResource extends Resource

@export_range(0, 100) var health : int
@export_range(0, 100) var attack : int
@export var move : Move

func getMove() -> Move:
	return move
