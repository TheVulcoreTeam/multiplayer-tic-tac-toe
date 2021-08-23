extends Node

var room_list = {
	'123456789':{
		"name":"Matias",
		"quantity":5
	}
}

var local_name

func create_room():
	var index = get_tree().get_rpc_sender_id()
	room_list[index] = [index]

func join_to_room(room):
	if room_list.has(room):
		var index = get_tree().get_rpc_sender_id()
		room_list[room]["users"].push_back({
			"name": local_name,
			"id":index
		})

func delete_room(room):
	if room_list.has(room):
		room_list.remove(room)


func get_room_list():
	rpc_id(1, "get_room_list_server")
	
remote func get_room_list_server():
	var id = get_tree().get_rpc_sender_id()
	room_list[id] = {
		"name" : str(id),
		"quantity" : 1
	}
	rpc_id(id, 'update_room_list', room_list)

remote func update_room_list(server_room_list):
	room_list = server_room_list
	Events.emit_signal('list_from_server', room_list)
	
	
