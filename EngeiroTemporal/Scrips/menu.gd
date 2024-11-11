extends Control

@onready var menu: VBoxContainer = $Menu
@onready var video: Control = $video
@onready var audio: Control = $Audio
@onready var options: Control = $options
@onready var credito: Control = $"Crédito"



func _process(delta: float) -> void:
	if visible == false:
		
		$AudioStreamPlayer2D.stop()
	if visible == true:
		$AudioStreamPlayer2D.play()
	if  Input.is_action_just_pressed("pause"):
		show_and_hide(options, menu)
		taggle()
		
func taggle() -> void:
	visible = !visible
	get_tree().paused = visible		


func _on_start_pressed() -> void:
	taggle()
	get_tree().change_scene_to_file("res://Scenes/historia.tscn")


func _on_options_pressed() -> void:
	show_and_hide(options, menu)
	
func show_and_hide(first, second) -> void:
	first.show()
	second.hide()	


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_video_pressed() -> void:
	show_and_hide(video, options)


func _on_audio_pressed() -> void:
	show_and_hide(audio, options)
	
	
func _on_back_from_option_pressed() -> void:
	show_and_hide(menu, options)

	
	
func _on_full_screen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		

func _on_borderless_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, toggled_on)


func _on_vsync_toggled(toggled_on: bool) -> void:
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)


func _on_back_from_video_pressed() -> void:
	show_and_hide(options, video)


func _on_master_value_changed(value: float) -> void:
	volume(0, value)
	
	
func volume(bus_index, value) -> void:
	AudioServer.set_bus_volume_db(bus_index, value)	



func _on_music_value_changed(value: float) -> void:
	volume(1, value)


func _on_sound_fx_value_changed(value: float) -> void:
	volume(2, value)


func _on_back_from_audio_pressed() -> void:
	show_and_hide(options, audio)


func _on_back_fromcredito_pressed() -> void:
	
	show_and_hide(menu, credito)


func _on_crédito_pressed() -> void:
	
	show_and_hide(credito, menu)
