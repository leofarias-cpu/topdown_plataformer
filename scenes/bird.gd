extends Area2D
var i = 0
@export var moves : Array
var is_reverse = false

func _process(delta):
	if Input.is_action_just_pressed("down") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right") or Input.is_action_just_pressed("up"):
		var next_move = moves[i]
		if is_reverse:
			position -= next_move * 16
		else:
			position += next_move * 16
		
		if is_reverse:
			i -= 1
			if i == -1: 
				is_reverse = false
				i += 1
		else:
			i += 1
			if i == len(moves):
				is_reverse = true
				i -= 1
