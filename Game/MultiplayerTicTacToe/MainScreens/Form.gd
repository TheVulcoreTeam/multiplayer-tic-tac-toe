extends Node

func _on_Save_pressed():
	var name = $ColorRect/VBoxContainer/LineEdit.text
	get_tree().change_scene("res://Game/MultiplayerTicTacToe/MainScreens/Lobby.tscn")
	rpc_id(1, "get_room_list")

func _process(delta):
	if Network.server!=null:
		if Network.server.is_listening(): # is_listening is true when the server is active and listening
			Network.server.poll()
	elif Network.client!=null:
		if (Network.client.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTED or
			Network.client.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTING):
				Network.client.poll()
