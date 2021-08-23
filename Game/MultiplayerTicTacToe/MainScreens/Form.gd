extends Node

func _on_Save_pressed():
	ServerLogic.local_name = $ColorRect/VBoxContainer/LineEdit.text
	get_tree().change_scene("res://Game/MultiplayerTicTacToe/MainScreens/Lobby.tscn")
	
	
	
	
	
	
	


#remote func get_room_list():
#	var id = get_tree().get_rpc_sender_id()
#	print_debug(id)
#	rpc_id(id, 'process_list', ServerLogic.room_list)
#	return room_list

#func _process(delta):
#	if Network.server!=null:
#		if Network.server.is_listening(): # is_listening is true when the server is active and listening
#			Network.server.poll()
#	elif Network.client!=null:
#		if (Network.client.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTED or
#			Network.client.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTING):
#				Network.client.poll()
