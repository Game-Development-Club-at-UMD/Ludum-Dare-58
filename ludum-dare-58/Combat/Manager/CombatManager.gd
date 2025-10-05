class_name CombatManager
extends Node

@onready var dodgeButton : DodgeButton = $DodgeButton
var dodging : bool = false

func _ready() -> void:
	dodgeButton.connect("dodgeStart", isDodging)
	dodgeButton.connect("dodgeEnd", stopDodging)


func switchTurn():
	pass


func isDodging():
	dodging = true

func stopDodging():
	dodging = false
