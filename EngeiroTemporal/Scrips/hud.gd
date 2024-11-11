extends CanvasLayer

@onready var vidab: TextureProgressBar = $vida


signal  repetir
@export var playe_path: NodePath
@onready var _player = get_node(playe_path)


func _ready() -> void:
	emit_signal("repetir")

func _process(delta: float) -> void:
	barras_Geral()
	
func barras_Geral() -> void:
	if _player:
		vidab.value = lerp(vidab.value, _player.vida * 100 / _player.vidaMax, 0.3)	


func _on_timer_timeout() -> void:
	emit_signal("repetir")
