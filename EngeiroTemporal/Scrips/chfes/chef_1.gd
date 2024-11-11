extends CharacterBody2D



const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")
var dialogchef1: bool = false
@export var misso: CanvasLayer = null



var dialogIni: Dictionary = {
	0:{
		"dialog": "Ei, você é o dono da Kuco-cola?",
	"title": "Tereza"
	},
	1:{
		"dialog": "-Sim! E você é a pessoa que está dando problemas para a minha empresa, certo? Qual seu objetivo e quem é você?",
	"title": "kuko-cola"
	},
	2:{
		"dialog": "-Prazer, sou Tereza! Trabalhava como professora e biologa... Venho aqui perdir um favor para você. ",
	"title": "Tereza"
	},
	3:{
		"dialog": "-Ok, Tereza. Qual seria o favor?",
	"title": "Kuko-cola"
	},
	4:{
		"dialog": "-Bem, eu peço que você use matériais recicláveis nos seus produtos...",
	"title": "Tereza"
	},
	5:{
		"dialog": "Mais uma ativista, hein? Como quiser, mas se quer mesmo isso, mereça.",
	"title": "kuko-cola"
	},
	6:{
		"dialog": " Você terá que passar pelos meus colaboradores antes, respondendo corretamente todas as minhas perguntas.",
	"title": "kuko-cola"
	},
	7:{
		"dialog": "Como a poluição afeta as tartarugas e outros animais marinhos?",
	"title": "kuko-cola"
	},
	
	
}


@export_category("Objects")
@export var hud: CanvasLayer = null




func _ready() -> void:
	Glogal.AlternativaChef = "chef1"
	Glogal.dialogchef = "Tem chef"

func  _process(delta: float) -> void:
	if dialogchef1 == true:
		if Input.is_action_pressed("INTERAGIR") :
			misso.visible = false
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog.data = dialogIni
			dialogchef1 = false
			hud.add_child(newDialog)

func _on_area_2d_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.show()
		dialogchef1 = true
		$AnimatedSprite2D.play("interagindo")


func _on_area_2d_body_exited(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.hide()
		dialogchef1 = false
		$AnimatedSprite2D.play("normal")
