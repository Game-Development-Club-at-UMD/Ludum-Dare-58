extends Node2D

@onready var timer = $Timer
@onready var progressbar = $ProgressBar
@onready var button = $Button

func buttonTimer() -> void:
	if(timer.time_left > 0):
		button.disabled = false
	else:
		button.disabled = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = progressbar.max_value
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:) -> void:
	buttonTimer()
	progressbar.value = timer.time_left		
	


func _on_button_pressed() -> void:
	print("yay")
