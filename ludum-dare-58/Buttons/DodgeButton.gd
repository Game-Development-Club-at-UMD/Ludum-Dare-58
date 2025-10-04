class_name DodgeButton
extends Node2D

@onready var label: Label = $Label
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var dodge_timer: Timer = $DodgeTimer


signal dodgeStart
signal dodgeEnd


func _ready() -> void:
	pass #connect signal to cooldownTimer wait time


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Dodge") and cooldown_timer.is_stopped():
		label.add_theme_color_override("font_color", Color(1, 1, 1, 0.5))
		startDodge()
		


func startDodge() -> void:
	dodgeStart.emit()
	dodge_timer.start()
	cooldown_timer.start()
	await dodge_timer.timeout
	dodgeEnd.emit()
	await cooldown_timer.timeout
	
	label.add_theme_color_override("font_color", Color(1, 1, 1, 1))


func updateCooldownTimer(cooldown : float, dodgeLength : float) -> void:
	dodge_timer.wait_time = dodgeLength
	cooldown_timer.wait_time = cooldown - dodgeLength
