extends State
class_name RUM



func  enter() -> void:
	$"../../passos".play()
	player.anim.play("rum")
	print("StateRUM")


func exit() -> void:
	$"../../passos".stop()
	print("sairStateRUM")

	
func process(delta: float) -> void:	
	if not  Input.is_action_pressed("a") and not Input.is_action_pressed("d"):
		get_parent().tranziçao(self, "IDE")
		print("t")
		
	if Input.is_action_pressed("pulo") and player.is_on_floor():
		get_parent().tranziçao(self, "jump")
	
		
func physics_process(delta: float) -> void:	
	pass
