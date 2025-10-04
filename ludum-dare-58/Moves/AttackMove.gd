class_name AttackMove
extends Move

@export var sprite : Texture2D
@export var Damage_Value : int = 2
@export_enum("DamageAtMaxHealth", "LowDamage") var modifier_type : int
@export var MaxHp : int

var modifier : Modifier = Modifier.new()

func DoAttack():
	print(modifier_type)
	Damage_Value = modifier.apply_modifier(modifier_type, Damage_Value, MaxHp)
	return Damage_Value
