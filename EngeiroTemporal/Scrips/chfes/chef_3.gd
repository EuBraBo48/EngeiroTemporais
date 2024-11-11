extends CharacterBody2D



const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")
var dialogchef3: bool = false

@export var misso: CanvasLayer = null


var dialogIni: Dictionary = {
	0:{
		"dialog": "Olha se não é a famosa Tereza! 'A mulher do meio ambiente', né? Vamos poupar a conversa, você está pronta?",
	"title": "Appear"
	},
	1:{
		"dialog": "Claro! Vamos logo, quero salvar o planeta antes que os macacos dominem o mundo!",
	"title": "Tereza"
	},
	2:{
		"dialog": "Qual tipo de indústria polui mais o meio ambinte?",
	"title": "Appear"
	}
	
	
}



@export_category("Objects")
@export var hud: CanvasLayer = null






func _ready() -> void:
	Glogal.AlternativaChef = "chef3"
	Glogal.dialogchef = "Tem chef"

func  _process(delta: float) -> void:
	if dialogchef3 == true:
		if Input.is_action_pressed("INTERAGIR") :
			misso.visible = false
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog.data = dialogIni
			dialogchef3 = false
			hud.add_child(newDialog)


func _on_area_2d_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		dialogchef3 = true
		$TouchScreenButton.show()
		$AnimatedSprite2D.play("interagindo")


func _on_area_2d_body_exited(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.hide()
		dialogchef3 = false
		$AnimatedSprite2D.play("normal")
