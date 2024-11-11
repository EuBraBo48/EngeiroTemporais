extends CharacterBody2D



const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")
var dialogchef2: bool = false

@export var misso: CanvasLayer = null



var dialogIni: Dictionary = {
	0:{
		"dialog": "Meu sócio mandou você aqui, Tereza. Vamos ver se você é a grande biologa que diz ser!",
	"title": "Trela-vita"
	},
	1:{
		"dialog": "Pergunte o que quiser, estou pronta!",
	"title": "Tereza"
	},
	2:{
		"dialog": "O lixo jogado na rua leva à ocorrência de alagamentos?",
	"title": "Trela-vita"
	}
	
}


@export_category("Objects")
@export var hud: CanvasLayer = null





func _ready() -> void:
	Glogal.AlternativaChef = "chef2"
	Glogal.dialogchef = "Tem chef"




func  _process(delta: float) -> void:
	if dialogchef2 == true:
		if Input.is_action_pressed("INTERAGIR") :
			misso.visible = false
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog.data = dialogIni
			dialogchef2 = false
			hud.add_child(newDialog)

func _on_area_2d_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.show()
		dialogchef2 = true
		$AnimatedSprite2D.play("interagindo")


func _on_area_2d_body_exited(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.hide()
		dialogchef2 = false
		$AnimatedSprite2D.play("normal")
