extends Control

var Buttonscene := preload("res://Combat/Scenes/attack_button.tscn")
@onready var grid_container: GridContainer = $GridContainer

var moveHolderInstance


func _ready() -> void: 


	debug()
	create_button_from_dict(moveHolderInstance)
	
func create_button_from_dict(Movedict: MoveHolder) -> void: 
		for key in Movedict.moveDict.keys(): 
			var newButton : ButtonInfo = Buttonscene.instantiate()
			grid_container.add_child(newButton)
			newButton.setMove(Movedict.moveDict[key]) 
			newButton.setupVisuals() 
			
func attackMove(newMoveHolder :MoveHolder):
	moveHolderInstance = newMoveHolder
			


func debug():
	var move1 : AttackMove = load("res://Moves/Resources/BasicAttack.tres")
	var move2 : AttackMove = load("res://Moves/Resources/BasicAttack2.tres")
	var move3 : AttackMove = load("res://Moves/Resources/BasicAttack.tres")
	var move4 : AttackMove = load("res://Moves/Resources/BasicAttack.tres")

	var h : MoveHolder = MoveHolder.new()
	h.addtoMoveDict("Move1", move1)
	h.addtoMoveDict("Move2", move2)
	h.addtoMoveDict("Move3", move1)
	h.addtoMoveDict("Move4", move1)
	
	moveHolderInstance = h
	print(moveHolderInstance.moveDict)
