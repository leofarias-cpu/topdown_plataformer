extends CharacterBody2D

@export var PIXELS: int
var last_move

@onready var right_move = $Colisao_direita
@onready var left_move = $Colisao_esquerda
@onready var up_move = $Colisao_cima
@onready var down_move = $Colisao_baixo

func _physics_process(delta):
	#Input
	var new_positon: Vector2
	var moved = false
	
	if Input.is_action_just_pressed("right") and not right_move.has_overlapping_bodies():
		new_positon = Vector2(1, 0)
		moved = true
	elif Input.is_action_just_pressed("left") and not left_move.has_overlapping_bodies(): 
		new_positon = Vector2(-1, 0)
		moved = true
	elif Input.is_action_just_pressed("up") and not up_move.has_overlapping_bodies():
		new_positon = Vector2(0, -1) 
		moved = true
	elif Input.is_action_just_pressed("down") and not down_move.has_overlapping_bodies():
		new_positon = Vector2(0, 1)
		moved = true
	else:
		new_positon = position
		
	if moved:		
		position += new_positon * PIXELS

	


