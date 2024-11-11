extends CharacterBody2D
class_name player

@export var velovi = 50.0
@export var pulo = -400.0
@export var _stateMachine: stateMachine = null

@onready var camera_2d: Camera2D = $Camera2D

@onready var anim: AnimatedSprite2D = $AnimTereza


@export var vida:= 100.0
@export var vidaMax:= 100.0
@export var regeneraVida:= 3.0

signal player_stats_changer

func _ready() -> void:
	_stateMachine.stateMacne(self)


func _process(delta: float) -> void:
	
	var new_health = min(vida + regeneraVida * delta, vidaMax)
	if new_health != vida :
		vida = new_health
	
	emit_signal("player_stats_changer")	

	veclMov()
	movPlay()
	move_and_slide()	
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	
func movPlay() -> void:
	var direção = Input.get_axis("a", "d")
	if direção:
		velocity.x = direção * velovi
	else:
		velocity.x = move_toward(velocity.x, 0 , velovi)
		


func veclMov() -> void:
	if velocity.x > 0:
		anim.flip_h = false
		
	if velocity.x < 0:
		anim.flip_h = true		


func dano(dar: int) -> void:
	if vida >= 0:
		vida -= dar
		$AnimTereza/AnimationPlayer.play("hit")
		emit_signal("player_stats_changer", self)
	if vida <= 0:
		Glogal.persoa = 0
		get_tree().change_scene_to_file("res://Scenes/game_overl.tscn")
	
