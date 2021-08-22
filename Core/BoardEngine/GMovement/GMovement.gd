"""
	GMovement:
		Movimiento generico
"""

extends Node

class_name GMovement

var piece : GPiece
var board : GBoard

var dir : Vector2

# El movimiento necesita saber la pieza cual se va a mover
func set_piece(_piece : GPiece):
	piece = _piece


# El movimiento necesita conocer el tablero
func set_board(_board : GBoard):
	board = _board


func move_to_map(to : Vector2):
	piece.global_position = board.get_board_coords(to)

