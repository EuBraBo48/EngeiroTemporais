extends State
class_name jump



func enter() -> void:
	$"../../passos".stop()
	player.anim.play("pulado")
	player.velocity.y = player.pulo  
	print("StateJUMP")


func exit() -> void:
	player.anim.play("fim")
	print("sairStateJUMP")

	
func process(delta: float) -> void:
	if player.is_on_floor():
		get_parent().tranziçao(self, "IDE")
	
	
	
func physics_process(delta: float) -> void:
	pass	
