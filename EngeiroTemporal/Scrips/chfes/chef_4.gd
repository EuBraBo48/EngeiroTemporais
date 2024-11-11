extends CharacterBody2D



const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")
var dialogchef4: bool = false

@export var misso: CanvasLayer = null


var dialogIni: Dictionary = {
	0:{
		"dialog": "Oh Tereza, você realmente conseguiu passar pelos meus colaboradores, né? Hahaha... Vamos logo com isso.",
	"title": "Maxsoft"
	},
	1:{
		"dialog": "Foi mais fácil que roubar doce de criança!",
	"title": "Tereza"
	},
	2:{
		"dialog": "Então, mande sua pergunta!",
	"title": "Tereza"
	},
	3:{
		"dialog": "Quais são os 3 R's?",
	"title": "Maxsoft"
	},
	
}


@export_category("Objects")
@export var hud: CanvasLayer = null






func _ready() -> void:
	Glogal.AlternativaChef = "chef4"
	Glogal.dialogchef = "Tem chef"

func  _process(delta: float) -> void:
	if dialogchef4 == true:
		if Input.is_action_pressed("INTERAGIR") :
			misso.visible = false
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog.data = dialogIni
			dialogchef4 = false
			hud.add_child(newDialog)

func _on_area_2d_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.show()
		print("234567kokjhgf")
		$AnimatedSprite2D.play("interagindo")
		dialogchef4 = true


func _on_area_2d_body_exited(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.hide()
		$AnimatedSprite2D.play("normal")
		dialogchef4 = false
