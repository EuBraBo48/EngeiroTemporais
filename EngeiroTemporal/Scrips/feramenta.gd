extends Area2D





func _on_body_entered(_body) -> void:
	if _body.is_in_group("player"):
		$CPUParticles2D.emitting = true
		$Audio.play()
		Glogal.contado += 1
		print("o numero",Glogal.contado)
		await get_tree().create_timer(0.1).timeout
		queue_free()
		
		
		
func _process(delta: float) -> void:
	if Glogal.contado == 5:
		
		queue_free()
