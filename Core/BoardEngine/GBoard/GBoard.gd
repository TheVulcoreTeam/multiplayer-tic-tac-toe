extends Node2D

class_name GBoard

# Tamaño del tablero
var board_size : Vector2
# Tamaño de la celda del tablero
var cell_size := 16

func _ready():
	set_board_size()


func set_board_size(_board_size := Vector2(7, 7)):
	board_size = _board_size


func get_board_coords(_board_cords : Vector2) -> Vector2:
	var board_global_position : Vector2
	
	if _board_cords.x > board_size.x:
		print_debug("Se sale de rango x: ", _board_cords.x)
		return Vector2(-1, -1) # ERROR
	elif _board_cords.y > board_size.y:
		print_debug("Se sale de rango y: ", _board_cords.y)
		return Vector2(-1, -1) # ERROR
		
	# TODO
	
	return board_global_position
