extends Node2D
class_name DIalogInicial

const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")

var DialogDepois: Dictionary = {
	
	0: {
		"dialog": "- O mundo... está  acabando, e se deteriorando. A ganância continuou  aumentando...",
		"title": "IAdemar"
	},
	1:{
		"dialog": "E aumentando. Assim, os mares foram engolidos, a terra,  e  as calotas polares... se foram. " ,
		"title": "IAdemar"
	},
	2:{
		"dialog": "O mar agora  virou um amontoado de lixo, e os céus, um aglomerado de destruição.",
		"title": "IAdemar"
	},
	3:{
		"dialog": "...",
		"title": "IAdemar"
	},
	4:{
		"dialog": "Não tenho certeza, Tereza, mas...
		Eu posso te ajudar a consertar as coisas,
		fazendo você voltar para o passado.",
		
		"title": "IAdemar"
	},

}


var DialogInicial: Dictionary = {
	
	0:{ "dialog": " Espaço - Tirar cutsceane e pular",
		
		"title": "Nicolas"
		
	},
	1:{ "dialog": "A D W S - Andar, E - Interagir, Entre - passar o diálogo ",
		
		"title": "Nicolas"
		
	},
	
	2:{ "dialog": "Botão direito do mouse - Atira, ESC - Pausa",
		
		"title": "Nicolas"
		
	},
	
}


@export_category("Objects")
@export var hud: CanvasLayer = null



func _ready() -> void:
	if Glogal.dialogchef == "primerio":
			$TouchScreenButton.hide()
			var new_dialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			new_dialog.data = DialogInicial
			get_tree().paused =true
			hud.add_child(new_dialog)

func _process(delta: float) -> void:	
	match  Glogal.dialogchef:
		"primerio":
			if Input.is_action_just_pressed("ui_select"):
				$TouchScreenButton.hide()
				var new_dialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
				new_dialog.data = DialogInicial
				get_tree().paused =true
				hud.add_child(new_dialog)

		"Não tem chef":
			if Input.is_action_just_pressed("ui_select"):
				$TouchScreenButton.hide()
				var new_dialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
				new_dialog.data = DialogDepois
				get_tree().paused =true
				hud.add_child(new_dialog)

			
