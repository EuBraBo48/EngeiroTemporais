extends CanvasLayer




@export var texte: String = ""
@export var texto: Label = null
@export var valor: int 
@export var gamever: String = ""


func _ready() -> void:
	Glogal.fases = gamever

func _process(delta: float) -> void:
	texto.text = texte + str(valor)+"/" + str(Glogal.chefes) 				
				
	
