extends Node2D

@onready var player = $player/Colisor

func _physics_process(delta):
	if not player.has_overlapping_areas():
		print('morreu')
		restart()
		
func restart():
	get_tree().reload_current_scene()
