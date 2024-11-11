extends Path2D

@export var tutorial: String = "Crie curva abaixo"
@export var loop: bool = true
@export var speed: float = 2.0
@export var speed_scale: float = 1.0

var caminho: PathFollow2D
var movimento: AnimationPlayer

func _ready():
	caminho = $Caminho
	movimento = $Movimento
	if loop:
		movimento.play("Platform_Move")
		movimento.speed_scale = speed_scale


func _physics_process(delta):
	if not loop:
		caminho.progress += speed * delta
