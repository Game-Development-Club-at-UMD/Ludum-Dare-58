class_name Modifier

var HP : int = 0
#var Multipler : float = 1.5

enum ModifierType {
	DAMAGEATMAXHEALTH
}

func DamageAtMaxHealth(damage : int):
	damage = damage * 1.5
	return int(damage)
	
func apply_modifier(mod_type: int, damage: int, hp : int) -> int:
	match mod_type:
		ModifierType.DAMAGEATMAXHEALTH:
			return DamageAtMaxHealth(damage)
		_:
			return damage
