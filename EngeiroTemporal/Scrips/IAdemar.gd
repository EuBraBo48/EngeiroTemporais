extends CharacterBody2D
class_name IAdemar

const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")
var dialogIA: bool = false
@onready var anim_ia: AnimatedSprite2D = $AnimIA



var DialgoIA: Dictionary ={
	0:{"dialog": "Olá Tereza. Pegue as peças para a máquina do tempo. São 5 peças, hein.  ;]",
	"title": "IAdemar"
	}
	
}

var DialogIA2: Dictionary = {
	0:{"dialog": "Assim que concertar a máquina do tempo, pressione 'Q' para embarcar na sua jornada temporal!",
	"title": "IAdemar"
		
	},
	1: {"dialog": "Boa sorte, Tereza :0",
	"title": "IAdemar"
		
	}
	
}

@export_category("Objects")
@export var hud: CanvasLayer = null


func _ready() -> void:
	Glogal.dialogIN = false

func _physics_process(delta: float) -> void:	
	if dialogIA == true:
		if Input.is_action_pressed("INTERAGIR") and Glogal.contado <=4:
			get_tree().paused = true
			var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			newDialog.data = DialgoIA
			anim_ia.play("normal")
			dialogIA = false
			hud.add_child(newDialog)
		if Glogal.contado == 5 and Input.is_action_pressed("INTERAGIR"):
			get_tree().paused = true
			var n2ewDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
			n2ewDialog.data = DialogIA2
			print("diaog3")
			anim_ia.play("normal")
			dialogIA = false
			hud.add_child(n2ewDialog)
			

func _on_area_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.show()
		dialogIA = true
		$Audio.play()
		anim_ia.play("interagindo")
		
		


func _on_area_body_exited(_body) -> void:
	if _body.is_in_group("player"):
		$TouchScreenButton.hide()
		anim_ia.play("normal")
		dialogIA = false
	
