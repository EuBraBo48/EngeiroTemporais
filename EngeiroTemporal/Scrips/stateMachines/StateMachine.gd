extends Node
class_name stateMachine

var _states: Dictionary = {}
var _stateAtual: State
@export var stateInicial: State

func  stateMacne(player) -> void:
	for i in get_children():
		_states[i.name]  = i
		i.player = player
	
	if  stateInicial:
		_stateAtual = stateInicial	
		_stateAtual.enter()


func  _process(delta: float) -> void:
	
	if _stateAtual:
		_stateAtual.process(delta)

	
func _physics_process(delta: float) -> void:
	if _stateAtual:
		_stateAtual.physics_process(delta)
	
	
func tranziçao(state, newState) -> void:
	if state != _stateAtual:
		print("Não tem STATE Inicaila")
		return
	if not _states.has(newState):
		print("Não TEM STATE")
		return
	if _stateAtual:
		_stateAtual.exit()		
	_stateAtual = _states[newState]
	_stateAtual.enter()
