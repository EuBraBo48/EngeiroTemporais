extends Node2D

var weapon = null
var _bala: PackedScene = preload("res://Scenes/bala.tscn")
@onready var marker_2d: Marker2D = $Marker2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	weapon = $"External(2)"

func _process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var direction = get_parent().global_position.direction_to(mouse_position).normalized()
	global_position = get_parent().global_position + direction * 40
	weapon.global_rotation = direction.angle()

	if global_position.x < get_parent().global_position.x:
		weapon.flip_v = true
	elif global_position.x > get_parent().global_position.x:
		weapon.flip_v = false
	
	if Input.is_action_pressed("mouse"):
		if timer.is_stopped():
			$Audio.play()
			shoot()

func shoot() -> void:
	var mouse_position = get_global_mouse_position()
	var bullet = _bala.instantiate()
	bullet.global_position = marker_2d.global_position
	bullet.direction = global_position.direction_to(mouse_position)
	marker_2d.position = bullet.direction
	marker_2d.rotation = bullet.rotation
	get_parent().add_sibling(bullet)  # Adicione a bala ao nó pai
	timer.start()
