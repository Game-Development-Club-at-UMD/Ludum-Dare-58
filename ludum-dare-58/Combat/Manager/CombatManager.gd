class_name CombatManager extends Node3D

@onready var dodgeButton : DodgeButton = %DodgeButton
@onready var enemy : Enemy = %Enemy
@onready var player: Player = %Player

var dodging : bool = false
var playerMaxHealth : int


func _ready() -> void:
	dodgeButton.connect("dodgeStart", isDodging)
	dodgeButton.connect("dodgeEnd", stopDodging)
	
	enemy.connect("sendEnemyMove", callMoveOnPlayer)
	
	player.connect("sendPlayerMove", callMoveOnPlayer)
	player.connect("sendMaxHealth", getPlayerMaxHealth)


func switchTurn():
	pass


func isDodging():
	dodging = true

func stopDodging():
	dodging = false


func callMoveOnPlayer(moveToCall : Move):
	moveToCall.DoMove(player)


func callMoveOnEnemy(moveToCall : Move):
	moveToCall.DoMove(enemy)

func getPlayerMaxHealth(pMaxHealth : int):
	playerMaxHealth = pMaxHealth
