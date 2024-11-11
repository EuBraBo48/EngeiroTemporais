extends CharacterBody2D

@export var _player_ref: player = null
@export var speed: int = 40
@export var vida: int = 15
@export var dano: int =5
var distancia = 0.0
var attack_delay: float = 1.0  # Tempo de atraso entre ataques (em segundos)
var time_since_last_attack: float = 0.0  # Tempo desde o último ataque

@onready var animatio: AnimationPlayer = $Animatio
@onready var seguranca_sheet: Sprite2D = $"Seguranca-sheet"



func _ready() -> void:
	_player_ref = _player_ref
	
	
func  _process(delta: float) -> void:
	position.y = 198
	time_since_last_attack += delta  # Atualiza o tempo desde o último ataque
	animent()
	verivM()
	if _player_ref:
		var direção = (_player_ref.position.x - position.x) / abs(_player_ref.position.x - position.x)
		var _distansia: float = global_position.distance_to(_player_ref.global_position)
		velocity.x = direção * speed
		velocity.y = 0
		distancia = _distansia
		move_and_slide()
		
		
		
func verivM() -> void:
	if velocity.x > 0:
		seguranca_sheet.flip_h = false
	if velocity.x < 0:
		seguranca_sheet.flip_h = true


func animent() -> void:
	if distancia < 50 and time_since_last_attack >= attack_delay and _player_ref  :  # Ajuste a distância conforme necessário
		animatio.play("atack")
		if animatio.current_animation_position >= 0.5:
			_player_ref.dano(dano)
			print(_player_ref.vida)
			print("testeDAMO")
			time_since_last_attack = 0.0  # Reseta o tempo desde o último ataque
			
		return	
	elif velocity != Vector2.ZERO:
		animatio.play("ide")
		return


func _on_area_area_entered(area) -> void:
	if area.is_in_group("bullte"):
		print("bala entreou")
		vida -= 1
		$AnimationPlayer.play("hite")
		print("12345678vdhgddh")
		if vida == 0:
			queue_free()
			Glogal.persoa += 1
			_player_ref.velovi += 5

func _on_persugu_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		_player_ref = _body as player
