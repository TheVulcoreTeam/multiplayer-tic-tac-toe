extends Node2D

var is_active := false


func _ready():
	set_active(true)
	

func set_active(_is_active : bool):
	is_active = _is_active
	
	if is_active:
		$Sprite.modulate = Color.white
	else:
		$Sprite.modulate = Color.darkgray
