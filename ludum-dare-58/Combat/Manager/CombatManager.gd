class_name CombatManager extends Node3D

@onready var dodgeButton : DodgeButton = %DodgeButton
@onready var enemy : Enemy = %Enemy
var dodging : bool = false

func _ready() -> void:
	dodgeButton.connect("dodgeStart", dodgeStart)
	dodgeButton.connect("dodgeEnd", dodgeEnd)
	
	enemy.connect("sendEnemyMove", callMoveOnPlayer)
	#player.connect("sendPlayerMove", callMoveOnPlayer)
	
	# give the player a moment to digest the scene before starting attack
	await get_tree().create_timer(5).timeout
	# do enemy attack here to start the cycle of dodging and whatnot

func switchTurn():
	pass


func dodgeStart():
	dodging = true

func dodgeEnd():
	dodging = false


func callMoveOnPlayer():
	pass


func callMoveOnEnemy(moveToCall : Move):
	moveToCall.DoMove(enemy)
