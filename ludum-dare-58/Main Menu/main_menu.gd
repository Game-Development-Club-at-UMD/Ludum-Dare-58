extends Node2D


func _ready() -> void:
	$CenterContainer/MainButtons/Play.grab_focus()
	$CenterContainer/SettingMenu/Fullscreen.button_pressed = true if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN else false
	$CenterContainer/SettingMenu/MainVolume.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master")))
	$CenterContainer/SettingMenu/MusicVolume.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("MUSIC")))
	$CenterContainer/SettingMenu/SFXVolume.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("SFX")))

func _on_play_pressed() -> void:
	print("change scene")

func _on_settings_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/SettingMenu.visible = true
	$CenterContainer/SettingMenu/Back.grab_focus()

func _on_credits_pressed() -> void:
	$CenterContainer/MainButtons.visible = false
	$CenterContainer/CreditsMenu.visible = true
	$CenterContainer/CreditsMenu/Back.grab_focus()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	$CenterContainer/MainButtons.visible = true
	if $CenterContainer/SettingMenu.visible:
		$CenterContainer/SettingMenu.visible = false
		$CenterContainer/MainButtons/Settings.grab_focus()
	if $CenterContainer/CreditsMenu.visible:
		$CenterContainer/CreditsMenu.visible = false
		$CenterContainer/MainButtons/Credits.grab_focus()


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)

func _on_main_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("Master"), value)

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("MUSIC"), value)

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(AudioServer.get_bus_index("SFX"), value)
