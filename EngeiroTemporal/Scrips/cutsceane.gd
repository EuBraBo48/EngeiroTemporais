extends Node2D

@onready var data: Button = $Data

func Data(s:String) -> void:
	data.text = s

func visive(s: String) -> void:
	if s == "TerraNormal":
		$TerraNomal.visible = false
	if s == "inicio":
		$TerraNomal.visible = true
		$TeraDestroida.visible = false
	if  s == "TerraDestrida":
		$TeraDestroida.visible = true	
