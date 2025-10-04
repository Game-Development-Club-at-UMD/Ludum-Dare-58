extends Node

@export var enemy: Resource = null

var current_player_health= 0  
var current_enemy_health = 0

func _ready():
	set_health(State.current_health, State.max_health, $Playerstats/ProgressBar )
	set_health(enemy.health, enemy.health, $VBoxContainer/EnemyHealth)
	print(State.max_health)
	
	current_player_health = State.current_health
	current_enemy_health = enemy.health 
	
func enemy_turn():
	current_player_health = max(0,current_player_health - enemy.damage )
	set_health(current_player_health, State.max_health, $Playerstats/ProgressBar)
		
	
func set_health(health, max_health, progress_bar): 
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP:%d/%d" % [health, max_health]	 
	


func _on_attack_1_pressed():
		current_enemy_health = max(0,current_enemy_health - State.player_attack1_damage )
		set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
		
		enemy_turn()
	


func _on_attack_2_pressed():
	current_enemy_health = max(0,current_enemy_health - State.player_attack2_damage )
	set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
		
	enemy_turn()
	


func _on_attack_3_pressed():
	current_enemy_health = max(0,current_enemy_health - State.player_attack3_damage )
	set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
		
	enemy_turn()
	
	


func _on_attack_4_pressed():
	current_enemy_health = max(0,current_enemy_health - State.player_attack4_damage )
	set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
		
	enemy_turn()
	
	
	
