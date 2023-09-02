extends CharacterBody2D

@export var PIXELS: int = 16
var last_move: String
#Normal 1 move collisions
@onready var right_move = $Colisao_direita
@onready var left_move = $Colisao_esquerda
@onready var up_move = $Colisao_cima
@onready var down_move = $Colisao_baixo
#Inertia movement collisions, 2 tiles away
@onready var ro_move = $Colisao_direita_outer
@onready var lo_move = $Colisao_esquerda_outer
@onready var uo_move = $Colisao_cima_outer
@onready var do_move = $Colisao_baixo_outer

@onready var colisor = $Colisor

@onready var has_inertia = false
@onready var steps = 0

func _physics_process(delta):
	#Input
	var new_position: Vector2
	var moved = false
	
	var collisions = {
		"r": right_move.get_overlapping_bodies(),
		"l": left_move.get_overlapping_bodies(),
		"u": up_move.get_overlapping_bodies(),
		"d": down_move.get_overlapping_bodies()	
	}
	
	#print(collisions)
	
	var this_move: String
	if Input.is_action_just_pressed("right") and not right_move.has_overlapping_bodies():
		new_position = Vector2(1, 0)
		moved = true
		this_move = "r"
	elif Input.is_action_just_pressed("left") and not left_move.has_overlapping_bodies(): 
		new_position = Vector2(-1, 0)
		moved = true
		this_move = "l"
	elif Input.is_action_just_pressed("up") and not up_move.has_overlapping_bodies():
		new_position = Vector2(0, -1) 
		moved = true
		this_move = "u"
	elif Input.is_action_just_pressed("down") and not down_move.has_overlapping_bodies():
		new_position = Vector2(0, 1)
		moved = true
		this_move = "d"
	else:
		new_position = position
		
	if moved:
		if last_move == this_move:
			steps += 1
		else:
			steps = 0
			
		if steps >= 2:
			has_inertia = true
		else:
			has_inertia = false
			
		last_move = this_move
		if has_inertia:
			inertia_move(new_position)
		else:
			normal_move(new_position)

func normal_move(new_position):
	position += new_position * PIXELS

func inertia_move(new_position):
	if last_move == "r" and not ro_move.has_overlapping_bodies():
		normal_move(new_position * 2)
	elif last_move == "l" and not lo_move.has_overlapping_bodies():
		normal_move(new_position * 2)
	elif last_move == "u" and not uo_move.has_overlapping_bodies():
		normal_move(new_position * 2)
	elif last_move == "d" and not do_move.has_overlapping_bodies():
		normal_move(new_position * 2)
	else:
		normal_move(new_position)

func _on_colisor_area_entered(area):
	if area.name == "Bunny":
		pass
	elif area.name == "Bird":
		print("fiquei tliste")
		die()

func die():
	print("F")
	owner.restart()
