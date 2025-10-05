extends Control

var Buttonscene := preload("res://Combat/Scenes/attack_button.tscn")



func _ready() -> void:
	pass
	
func create_button_from_dict(Movedict: Dictionary) -> void:
		for i in range(Movedict):
			var button = Buttonscene.instantiate()
			
			
			
			
			
			
		
		
