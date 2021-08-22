extends Node

# Turno actual
var index_current_shift
# Todos los turnos
var _shifts : Array


func set_shifts(shift : Array):
	_shifts = shift


func next_turn():
	if _shifts.empty():
		return
	
	index_current_shift = (index_current_shift + 1) % _shifts.size()
