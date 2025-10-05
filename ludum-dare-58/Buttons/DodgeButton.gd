class_name DodgeButton
extends Node2D

@onready var label: Label = $Label
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var dodge_timer: Timer = $DodgeTimer

var player_dodged : bool = false
var can_dodge : bool = false

signal dodgeStart
signal dodgeEnd(player_dodged : bool)


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	if can_dodge and !player_dodged:
		if Input.is_action_just_pressed("Dodge"):
			player_dodged = true
			label.add_theme_color_override("font_color", Color(0.0, 0.951, 0.206, 0.5))
	
	# aria: assuming this is for debug purposes?
	#if Input.is_action_just_pressed("Dodge") and cooldown_timer.is_stopped():
		#label.add_theme_color_override("font_color", Color(1, 1, 1, 0.5))
		#startDodge()


func startDodge(time_length : int) -> void:
	label.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 1.0))
	dodgeStart.emit()
	can_dodge = true
	dodge_timer.start(time_length)
	##cooldown_timer.start(time_length + 1)
	#await dodge_timer.timeout
	##await cooldown_timer.timeout
	#label.add_theme_color_override("font_color", Color(1, 1, 1, 1))
	


func updateCooldownTimer(cooldown : float, dodgeLength : float) -> void:
	dodge_timer.wait_time = dodgeLength
	cooldown_timer.wait_time = cooldown - dodgeLength


func _on_dodge_timer_timeout() -> void:
	print('dodge timer timed out')
	label.add_theme_color_override("font_color", Color(1.0, 1.0, 1.0, 0.0))
	can_dodge = false
	dodgeEnd.emit(player_dodged)
	player_dodged = false
