extends Node2D


var room_element = preload("res://Game/MultiplayerTicTacToe/MainScreens/LobbyElements/Room.tscn")
func _on_Button_Create_pressed():
	#todo create lobby
	pass # Replace with function body.


func _on_Button_Start_pressed():
	#todo start the game
	pass # Replace with function body.

static func delete_children(node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

func set_users_names(room_dic):
	delete_children($VBoxContainer)
	for element in room_dic:
		var room_item = room_element.instance()
		room_item.get_node("JoinTo").text = "Join"
		room_item.get_node("RoomName").text = str(room_dic[element]["name"]) +" "+ str(room_dic[element]["qantity"])
		room_item.get_node("JoinTo").connect("pressed", self, "on_pressed", [element] )
		$VBoxContainer.add_child(room_item.get_node("JoinTo"))
		continue
		
	if $VBox.get_children().size() == 0:
		var room_item = room_element.instance()
		room_item.get_node("RoomName").text = "Waiting for rooms"
		$VBox.add_child(room_item)

			
