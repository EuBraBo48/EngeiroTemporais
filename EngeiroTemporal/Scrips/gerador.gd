extends Node2D
class_name gerador

var leveio: int = 10
@export var _playe: player = null
var inimigo1: PackedScene = preload("res://Scenes/animigo_1.tscn")



func  _ready() -> void:
	Glogal.fases = "res://Scenes/cana_do_inimigo_1.tscn"

func _on_hud_repetir() -> void:
	leveio += 3
	for i in range(leveio):
		var inimigo = inimigo1.instantiate()
		inimigo.global_position = Vector2(randf_range(4, 2400), 198) # Posição X aleatória, Y fixa em 198
		add_child(inimigo)
		print("sibora")
	

func _physics_process(delta: float) -> void:
	if Glogal.persoa >= 16:	
		get_tree().change_scene_to_file("res://Scenes/cana_do_inimigo_2.tscn")
		Glogal.persoa = 0



func _on_area_2d_body_entered(_body) -> void:	
	if _body.is_in_group("player"):
		_playe.vida += 10
		queue_free()
