extends Area2D


var direction : Vector2 = Vector2.ZERO
var velocity : int = 160
var damage : int = 0



func _process(delta: float) -> void:
	position += direction * velocity * delta
	

func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(_area) -> void:
	if _area.is_in_group("inimi"):
		$CPUParticles2D.emitting = true
		await get_tree().create_timer(0.1).timeout
		queue_free()
		print("134")
		
