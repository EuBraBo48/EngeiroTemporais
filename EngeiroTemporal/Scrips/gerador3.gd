extends Node2D

var inimigos: Array = [
	preload("res://Scenes/animigo_1.tscn"),
	preload("res://Scenes/inimigo_2.tscn")
]

var levei: int = 10


func _ready() -> void:
	Glogal.fases = "res://Scenes/cana_do_inimigo_3.tscn"

func _on_hud_repetir() -> void:
	levei += 4
	for i in range(abs(levei)):	
		var escolhe_inimgo = inimigos[randi() % inimigos.size()].instantiate()
		escolhe_inimgo.global_position = Vector2(randf_range(10, 2400), 198)
		add_child(escolhe_inimgo)

func _process(delta: float) -> void:
	if Glogal.persoa == 30:
		get_tree().change_scene_to_file("res://Scenes/chefes/cena_chef_1.tscn")
		Glogal.dialogchef = "Tem chef" 
