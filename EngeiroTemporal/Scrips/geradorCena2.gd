extends Node2D

var levei: int = 6
var inmigo2: PackedScene = preload("res://Scenes/inimigo_2.tscn")

func _ready() -> void:
	Glogal.fases = "res://Scenes/cana_do_inimigo_2.tscn"
	

func _on_hud_repetir() -> void:
	levei += 4
	for i in range(levei):
		var nimi2 = inmigo2.instantiate()
		nimi2.global_position = Vector2(randf_range(10, 2400), 198)
		add_child(nimi2)
		
func _process(delta: float) -> void:
	if Glogal.persoa  >= 20:
		get_tree().change_scene_to_file("res://Scenes/cana_do_inimigo_3.tscn")
		Glogal.persoa = 0
			
