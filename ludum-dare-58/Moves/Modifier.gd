class_name Modifier

#var Multipler : float = 1.5

enum ModifierType {
	NONE, DAMAGEATMAXHEALTH, CRIPPLED
}

func DamageAtMaxHealth(damage : int):
	damage = damage * 2
	return damage

func Crippled(damage:int):
	damage *= 0.6
	return round(damage)

func apply_modifier(mod_type: int, damage: int) -> int:
	match mod_type:
		ModifierType.DAMAGEATMAXHEALTH:
			return DamageAtMaxHealth(damage)
		ModifierType.CRIPPLED:
			return Crippled(damage)
		_:
			return damage
