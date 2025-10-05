class_name Player extends ParentCreature


#Signal Max Health
signal maxHealth()

#Signal Attack
signal attackEnemy()


#Function to alter health
func takeDamage(health : int, damage : int) -> int:
	health -= damage
	return health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	pass
