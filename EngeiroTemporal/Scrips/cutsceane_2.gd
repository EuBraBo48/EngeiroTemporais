extends Node2D

@onready var data: Button = $Data

func Data(s:String) -> void:
	data.text = s
	print("ertyuç")

func visive(s: String) -> void:
	if s == "TerraNormal":
		$TerraNomal.visible = true
	if s == "inicio":
		$TerraNomal.visible = false
		$TeraDestroida.visible = true
		print("ddddd")
	if  s == "TerraDestrida":
		$TeraDestroida.visible = false	
