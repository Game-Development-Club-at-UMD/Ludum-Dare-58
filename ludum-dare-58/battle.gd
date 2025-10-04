extends Node

@export var enemy: Resource = null

func _ready():
	set_health(State.current_health, State.max_health,$Playerstats/VBoxContainer/ProgressBar )
	set_health(enemy.health, enemy.health, $VBoxContainer/ProgressBar)
	print(State.max_health)
func set_health(health, max_health, progress_bar): 
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP:%d/%d" % [health, max_health]	 
	
