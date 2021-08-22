extends Control

onready var multiplayer_config_ui = $Multiplayer_configure
onready var server_ip_address = $Multiplayer_configure/VBoxLabels/ServerIPAdress
onready var device_ip_address = $CanvasLayer/device_ip_address

var move_up = Vector2.ZERO


func _process(delta):
	if Network.server!=null:
		if Network.server.is_listening(): # is_listening is true when the server is active and listening
			Network.server.poll()
	elif Network.client!=null:
		if (Network.client.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTED or
			Network.client.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTING):
				Network.client.poll()


func _ready() -> void:
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	
	if OS.has_feature("Server"):
		Network.create_server()


func _player_connected(id) -> void:
	print_debug("Player " + str(id) + " has connected")


func _player_disconnected(id) -> void:
	print_debug("Player " + str(id) + " has disconnected")


func _on_create_server_pressed():
	multiplayer_config_ui.hide()
	Network.create_server()


func _on_join_server_pressed():
	if server_ip_address.text != "":
		multiplayer_config_ui.hide()
		Network.ip_address = server_ip_address.text
		Network.join_server()


func _input(event):
	if event.is_action_pressed("ui_up"):
		$Test.text = $Test.text + "input() "
		rpc("move")


remotesync func move():
	$Test.text = $Test.text + "move() "
	$Player1.global_position += Vector2.UP * 10

