extends Control

func _on_return_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/interface/menu/menu.tscn"menu/menu.tscn")
	

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/interface/menu/menu.tscn")
