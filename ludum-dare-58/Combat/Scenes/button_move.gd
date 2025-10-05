extends Button

@onready var label: Label = $Label
@onready var sprite_2d: Sprite2D = $Sprite2D

var move : Move 

func setText():
	label.text = move.getName()
	
func setSprie():
	#sprite_2d.texture = move.ge
	pass
	
func getAttack() -> int:
	move = move as AttackMove
	return move.getAttack()
