extends Control
class_name  DialogScreen

var _step: float = 0.5

var _id: int = 0
var data: Dictionary = {}
var verda = true


@export var altenativ_as: Node2D = null
@export_category("Objects")
@export var _name: Label = null
@export var _dialog: RichTextLabel = null


@onready var altenativas: Node2D = $ALTENATIVAs




func _ready() -> void:
	_initialicia_dialogi()


func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_accept") and _dialog.visible_ratio < 1:
		_step = 0.01
		return

	_step = 0.5

	if Input.is_action_just_pressed("ui_accept"):
		match Glogal.dialogchef:
			"primerio":
				_id += 1
				if _id == data.size():
					if Glogal.dialogIN:
						get_tree().paused = false
						Glogal.dialogchef = "Não tem chef"
						get_tree().change_scene_to_file("res://Scenes/historia.tscn")
					else:
						queue_free()
						get_tree().paused = false
					return
				_initialicia_dialogi()
				
				
			"Não tem chef":
				_id += 1
				if _id == data.size():
					if Glogal.dialogIN:
						get_tree().paused = false
						get_tree().change_scene_to_file("res://Scenes/cena_1.tscn")
					else:
						queue_free()
						get_tree().paused = false
					return
				_initialicia_dialogi()

			"Tem chef":
				_id += 1
				if _id == data.size():
					verda = false
					altenativ_as.show()
					return
				if verda:
					_initialicia_dialogi()

			"Game over":
				_id += 1
				if _id == data.size():
					get_tree().paused = false
					get_tree().change_scene_to_file("res://Scenes/game_overl.tscn")
					return
				_initialicia_dialogi()

			"Prosimo":
				_id += 1
				if _id == data.size():
					get_tree().paused = false
					match Glogal.AlternativaChef:
						"chef1":
							Glogal.chefes += 1
							get_tree().change_scene_to_file("res://Scenes/chefes/cena_chef_2.tscn")
						"chef2":
							Glogal.chefes += 1
							get_tree().change_scene_to_file("res://Scenes/chefes/cena_chef_3.tscn")
						"chef3":
							Glogal.chefes += 1
							get_tree().change_scene_to_file("res://Scenes/chefes/cena_chef_4.tscn")
						"chef4":
							get_tree().change_scene_to_file("res://Scenes/historia_fimal.tscn")
					return
				_initialicia_dialogi()

			"FIM":
				_id += 1
				if _id == data.size():
					queue_free()
					get_tree().change_scene_to_file("res://Scenes/menu.tscn")
					return
				_initialicia_dialogi()
					
					
func _initialicia_dialogi() -> void:
	if data.has(_id):
		_name.text = data[_id]["title"]
		_dialog.text = data[_id]["dialog"]
		_dialog.visible_characters = 0
		
		while _dialog.visible_ratio < 1:
			await get_tree().create_timer(_step).timeout
			_dialog.visible_characters += 1
	else:
		print("Erro: Índice fora do limite ou dados faltando para _id: %d" % _id)



func _on_button_1_pressed() -> void:
	Glogal.dialogchef = "Game over"
	print(Glogal.dialogchef)
	altenativ_as.hide()

	# Atualizando o dicionário de diálogos dependendo da alternativa
	if Glogal.AlternativaChef == "chef1":
		data = altenativas.dialogErro1
	elif Glogal.AlternativaChef == "chef2":
		data = altenativas.dialogErro2
	elif Glogal.AlternativaChef == "chef3":
		data = altenativas.dialogErro3
	elif Glogal.AlternativaChef == "chef4": 
		data = altenativas.dialogErro4

	# Atualiza o índice do diálogo
	_id = 0
	_initialicia_dialogi()


func _on_button_2_pressed() -> void:
	Glogal.dialogchef = "Prosimo"
	altenativ_as.hide()

	# Atualizando o dicionário de diálogos dependendo da alternativa correta
	if Glogal.AlternativaChef == "chef1":
		data = altenativas.dialogCorretor1
	elif Glogal.AlternativaChef == "chef2":
		data = altenativas.dialogCorretor2
	elif Glogal.AlternativaChef == "chef3":
		data = altenativas.dialogCorretor3
	elif Glogal.AlternativaChef == "chef4":
		data = altenativas.dialogCorretor4

	# Atualiza o índice do diálogo
	_id = 0
	_initialicia_dialogi()
