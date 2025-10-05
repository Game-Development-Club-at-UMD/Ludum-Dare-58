class_name MoveHolder extends Node

var moveDict: Dictionary[String, Move]


func addtoMoveDict(newMove : Move):
	moveDict.get_or_add(newMove.getName())


func getMoveFromDict(key : String) -> Move:
	return moveDict[key]


func clearDict():
	moveDict.clear()
