extends Node2D

@onready var timer = $Timer
@onready var progressbar = $ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = progressbar.max_value
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:) -> void:
	progressbar.value = timer.time_left		
