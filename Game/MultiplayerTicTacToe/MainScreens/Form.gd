extends Node

func _on_Save_pressed():
	var name = $ColorRect/VBoxContainer/LineEdit.text
	#todo send name to server
	get_tree().change_scene("res://Game/MultiplayerTicTacToe/MainScreens/Lobby.tscn")
	pass # Replace with function body.
