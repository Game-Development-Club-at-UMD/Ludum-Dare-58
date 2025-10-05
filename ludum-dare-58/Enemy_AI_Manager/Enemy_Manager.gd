class_name EnemyCreature extends Node 

@onready var creature: ParentCreature = $ParentCreature

var rNum

## Random Selection of one of the current moves	
func SelectMove():
	rNum = randi_range(1, creature.getMovesHolder().moveDict.size())
	creature.getMovesHolder().getMoveFromDict("Move"+ str(rNum))
	print(creature.getMovesHolder().getMoveFromDict("Move"+ str(rNum)).getName())

func SendDamageToPlayer() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_accept"):
		SelectMove()
		
