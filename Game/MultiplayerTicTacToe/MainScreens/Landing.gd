extends Node2D

func _ready():
	
	pass # Replace with function body.




func _on_Button_go_to_form():
	Network.join_server()
	get_tree().change_scene("res://Game/MultiplayerTicTacToe/MainScreens/Form.tscn")
	pass # Replace with function body.


func _on_set_as_server():
	Network.create_server()
	pass # Replace with function body.
