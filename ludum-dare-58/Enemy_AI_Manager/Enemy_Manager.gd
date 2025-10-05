extends Node

@onready var attackMove

var moveDict : MoveHolder = MoveHolder.new()

#Place holder for now
var health : int = 21
var Damage : int 
var AttackHPC : bool
var selfDamage : int

# AI dosnt Kill itself with moves that do self damage	
#func AttackHPCheck(SelfDamage) -> bool:
	#if((health - SelfDamage) > 0):
		#return true
	#else:
		#return false
	
# Random Selection of one of the 4 moves	
func SelectMove(move):
	match move:
		1:
#			Needs to be able to return that certain mvoes damage
			print("move1")
		2:
			print("move2")
		3:
			print("move3")
		4:
			print("move4")
		_: 
			return Damage

func SendDamageToPlayer() -> void:
	pass

func _ready() -> void:
	attackMove = randi_range(1, 4)
	SelectMove(attackMove)
		
		#AttackHPC = AttackHPCheck(SelectMove(attackMove))
		#if AttackHPC:
			#break
		#else:
			#pass
		
		#if(move.hasSelfDamage)
