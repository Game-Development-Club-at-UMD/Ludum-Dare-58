class_name AttackMove
extends Move

@export var Damage_Value : int = 0
@export_enum("None", "DamageAtMaxHealth") var modifier_type : int


var modifier : Modifier = Modifier.new()

func getAttack():
	return Damage_Value


func DoMove(target : ParentCreature) -> void:
	print(modifier_type)
	Damage_Value = modifier.apply_modifier(modifier_type, Damage_Value)
	#target.callDamage()
