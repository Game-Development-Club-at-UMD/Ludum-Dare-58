extends Node

@export var enemy: Resource = null
@export var adaptabe_button: Resource = null 

var current_player_health= 0  
var current_enemy_health = 0

signal textbox_closed 


func _ready():
	
	##var attack_button = load("res://Combat/Scenes/attack_button.tscn")
	##var new_attack_button = attack_button.instantiate()
	##add_child(new_attack_button) 
	
	
	displaytext("a wild p-whizz has appeared!!!!!!! ")
	
	
	set_health(State.current_health, State.max_health, $Playerstats/ProgressBar )
	set_health(enemy.health, enemy.health, $VBoxContainer/EnemyHealth)
	
	await self.textbox_closed 
	
	current_player_health = State.current_health
	current_enemy_health = enemy.health 
	

	
	
	
func set_health(health, max_health, progress_bar): 
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("Label").text = "HP:%d/%d" % [health, max_health]	 

	
	
	
func _input(event):
	if Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$Textbox.hide()
		emit_signal("textbox_closed")
	
func displaytext(text):
	$Textbox.show()
	$Textbox/Label.text = text	
	
func enemy_turn():
	displaytext("the enemy slapped you for 20 damage")
	current_player_health = max(0,current_player_health - enemy.damage )
	set_health(current_player_health, State.max_health, $Playerstats/ProgressBar)
	await self.textbox_closed
		
	

	


func _on_attack_1_pressed():
		displaytext("you shat on the enemy and dealt %d damage" % State.player_attack1_damage)
		current_enemy_health = max(0,current_enemy_health - State.player_attack1_damage )
		set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
		await self.textbox_closed
		
		
		enemy_turn()
	


func _on_attack_2_pressed():
	displaytext("you shot the enemy and dealt %d damage" % State.player_attack2_damage)
	current_enemy_health = max(0,current_enemy_health - State.player_attack2_damage )
	set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
	await self.textbox_closed
		
	enemy_turn()
	


func _on_attack_3_pressed():
	displaytext("you talked to the enemy and dealt %d damage" % State.player_attack3_damage)
	current_enemy_health = max(0,current_enemy_health - State.player_attack3_damage )
	set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
	await self.textbox_closed
		
	enemy_turn()
	
	


func _on_attack_4_pressed():
	displaytext("you bananaed on the enemy and dealt %d damage" % State.player_attack4_damage)
	current_enemy_health = max(0,current_enemy_health - State.player_attack4_damage )
	set_health(current_enemy_health, enemy.health, $VBoxContainer/EnemyHealth)
	await self.textbox_closed
		
	enemy_turn()
	
	
	
