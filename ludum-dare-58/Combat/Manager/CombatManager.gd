class_name CombatManager extends Node3D

@onready var dodgeButton : DodgeButton = %DodgeButton
@onready var enemy : Enemy = %Enemy
var dodging : bool = false

func _ready() -> void:
	dodgeButton.connect("dodgeStart", isDodging)
	dodgeButton.connect("dodgeEnd", stopDodging)
	
	enemy.connect("sendEnemyMove", callMoveOnPlayer)
	#player.connect("sendPlayerMove", callMoveOnPlayer)


func switchTurn():
	pass


func isDodging():
	dodging = true

func stopDodging():
	dodging = false


func callMoveOnPlayer():
	pass


func callMoveOnEnemy(moveToCall : Move):
	moveToCall.DoMove(enemy)
