class_name AttackMove
extends Move

@export var sprite : Texture2D
@export var Damage_Value : int = 0
@export_enum("None", "DamageAtMaxHealth") var modifier_type : int

var modifier : Modifier = Modifier.new()

func DoAttack():
	print(modifier_type)
	Damage_Value = modifier.apply_modifier(modifier_type, Damage_Value)
	return Damage_Value
