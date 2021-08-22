extends Node2D

class_name GPiece

var board : GBoard
#var movement : GMovement


# El GPiece debe conocer su entorno
func set_board(_board : GBoard):
	board = _board


# El GPiece debe tener movimiento
func set_movement(_movement):
#	movement = _movement
	pass
