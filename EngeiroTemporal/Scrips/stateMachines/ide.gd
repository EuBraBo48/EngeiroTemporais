extends State
class_name IDE


func  enter() -> void:
	$"../../passos".stop()
	player.anim.play("Ide")
	print("StateIDE")
	

func exit() -> void:	
	print("sairStateIDE")

	
func process(delta: float) -> void:	
	if Input.is_action_pressed("a") or Input.is_action_pressed("d"):
		get_parent().tranziçao(self, "rum")
		
	if Input.is_action_pressed("pulo") and player.is_on_floor():
		player.anim.play("entrando")
		get_parent().tranziçao(self, "jump")
		
		
func physics_process(delta: float) -> void:	
	pass
