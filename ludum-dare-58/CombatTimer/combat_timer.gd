extends Node2D

@onready var timer = $Timer
@onready var progressbar = $ProgressBar
@onready var button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = progressbar.max_value
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:) -> void:
	if(timer.time_left > 0):
		button.disabled = true
	else:
		button.disabled = false
	progressbar.value = timer.time_left		


func _on_button_button_down() -> void:
	print("yay")
