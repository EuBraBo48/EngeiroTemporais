extends Node2D

const _DIALOG_SCREEEN: PackedScene =  preload("res://Scenes/dialogo_secre.tscn")
@export var _player: player

var dialogIn: Dictionary = {
	0:{"dialog":"Isso é o futuro, que incrível",
		"title":"Tereza"
		
		},
	1:{
		"dialog":"Ok, tenho que convencer os chefões a parar de poluir, se não aceitarem, os mostrarei o futuro ",
		"title":"Tereza"
	},

}

@export_category("Objects")
@export var hud: CanvasLayer = null

func _ready() -> void:
	_player.camera_2d.limit_right = 2500
	get_tree().paused = true
	var newDialog: DialogScreen = _DIALOG_SCREEEN.instantiate()
	newDialog.data = dialogIn
	hud.add_child(newDialog)
	
