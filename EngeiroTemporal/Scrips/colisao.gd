extends Area2D
class_name Porta

var TaNaPorta: bool = false
@export var porta: String 



func _process(delta: float) -> void:
	if TaNaPorta == true:
		if Input.is_action_pressed("INTERAGIR"):
			TaNaPorta = false
			print("entrou na porta")
			get_tree().change_scene_to_file(porta)
			
			


func _on_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.show()
		$Audio.play()
		TaNaPorta = true
		print("porta")
	
		


func _on_body_exited(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.hide()
		TaNaPorta = false
