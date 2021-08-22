extends Node

const DEFAULT_PORT = 9080
const MAX_CLIENTS = 4

var server
var client

var ip_address := "0.0.0.0"

func _ready() -> void:
	get_tree().connect("connected_to_server", self, "_connected_to_server")
	get_tree().connect("server_disconnected", self, "_server_disconnected")


func create_server() -> void:
	server = WebSocketServer.new()
	var result = server.listen(DEFAULT_PORT, PoolStringArray(), true)
	
	if result == OK:
		get_tree().network_peer = server
		server.connect("peer_connected", self, "player_connected")
		server.connect("peer_disconnected", self, "player_disconnected")


func join_server() -> void:
	client = WebSocketClient.new()
	var result = client.connect_to_url(ip_address, PoolStringArray(), true)
	
	if result == OK:
		get_tree().network_peer = client
		client.connect("peer_connected", self, "player_connected")
		client.connect("peer_disconnected", self, "player_disconnected")


func _connected_to_server() -> void:
	print("Se ha conectado al Server exitosamente.")


func _server_disconnected() -> void:
	print("Se ha desconectado del Server.")


func player_connected():
	print_debug("connected")


func player_disconnected():
	print_debug("disconnected")

