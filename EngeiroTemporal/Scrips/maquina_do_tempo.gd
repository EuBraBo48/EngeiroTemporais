extends Area2D

var TaNaM: bool = false



func _process(delta: float) -> void:
	if TaNaM == true and Input.is_action_pressed("INTERAGIR") and Glogal.contado == 5:
		Glogal.ver = true
		get_tree().change_scene_to_file("res://Scenes/cana_do_inimigo_1.tscn")
		TaNaM = false

func _on_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.show()
		$Audio.play()
		TaNaM = true


func _on_body_exited(_sbody) -> void:
	$TouchScreenButton.hide()
	TaNaM = false
