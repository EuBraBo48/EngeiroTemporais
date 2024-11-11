extends Node2D



const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")

var DialogInicial: Dictionary = {
	
	0: {
		"dialog": "Se tudo se resolvesse assim, na base do diálogo...",
		"title": "IAdemar"
	},
	1:{
		"dialog": "Obrigado por jogar :] " ,
		"title": "G.D Nicolas"
	},
	2:{
		"dialog": "FIM",
		"title": "Nicolas"
	}

}


@export_category("Objects")
@export var hud: CanvasLayer = null

func _ready() -> void:
	Glogal.dialogchef = "FIM"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		print("texte")
		var new_dialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
		new_dialog.data = DialogInicial
		get_tree().paused =true
		hud.add_child(new_dialog)
