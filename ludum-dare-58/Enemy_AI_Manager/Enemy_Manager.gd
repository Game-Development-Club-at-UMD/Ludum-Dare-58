extends Node

@onready var attackMove

#Place holder for now
var health : int = 21
var Damage : int 
var AttackHPC : bool

# AI dosnt Kill itself with moves that do self damage	
func AttackHPCheck(SelfDamage) -> bool:
	if((health - SelfDamage) > 0):
		return true
	else:
		return false
	
# Random Selection of one of the 4 moves	
func SelectMove(move) -> int:
	match move:
		1:
			print("move1")
			Damage = 30
			return Damage
		2:
			print("move2")
			Damage = 28
			return Damage
		3:
			print("move3")
			Damage = 25
			return Damage
		4:
			print("move4")
			Damage = 15
			return Damage
		_: 
			return Damage

func _ready() -> void:
	while(true):
		attackMove = randi_range(1, 4)
		print("AttackMove: ", attackMove)
		SelectMove(attackMove)
		
		AttackHPC = AttackHPCheck(SelectMove(attackMove))
		if AttackHPC:
			break
		else:
			pass
