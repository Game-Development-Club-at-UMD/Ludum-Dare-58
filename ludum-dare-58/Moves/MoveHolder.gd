class_name MoveHolder extends Node

var moveDict: Dictionary[String, Move]


func addtoMoveDict(moveName : String, newMove : Move):
	moveDict.get_or_add(moveName, newMove)


func getMoveFromDict(key : String) -> Move:
	return moveDict[key]


func clearDict():
	moveDict.clear()
