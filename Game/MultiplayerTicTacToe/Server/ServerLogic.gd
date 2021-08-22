extends Node

var room_list = {
	'123456789':[1,2,3]
}

func create_room():
	var index = get_tree().get_rpc_sender_id()
	room_list[index] = [index]

func join_to_room(room):
	if room_list.has(room):
		var index = get_tree().get_rpc_sender_id()
		room_list[room].push_back(index)

func delete_room(room):
	if room_list.has(room):
		room_list.remove(room)


remote func get_room_list():
	var id = get_tree().get_rpc_sender_id()
	rpc_id(id, 'process_list', room_list)
	return room_list




