extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/startBtn.grab_focus()

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()


func _on_control_btn_pressed():
	get_tree().change_scene_to_file("res://interface/menu/controls_interface.tscn")
