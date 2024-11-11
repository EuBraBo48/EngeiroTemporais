extends CanvasLayer

@export var texte: String = ""
@export var texto: Label = null
@export var _player: player
@export var valor: int 


func _ready() -> void:
	_player.camera_2d.limit_right = 1825
	



func _process(delta: float) -> void:
	texto.text = texte + str(valor)+"/" + str(Glogal.contado) 				
	if Glogal.contado ==  5 and Glogal.ver == false:
		texto.text = "Fale com IAderma.
					E vá para o futuro"
	if Glogal.ver == true:
		texto.text = texte + str(valor)+"/" + str(Glogal.persoa) 				
	
