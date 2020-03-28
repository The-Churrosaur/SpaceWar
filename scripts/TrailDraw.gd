extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var new_position : Vector2
var old_position : Vector2

export var frame_gap = 10
var frame_timer = 0

export var num_segments = 10
var point_list = [] #AAAAAAHHHHHH

# Called when the node enters the scene tree for the first time.
func _ready():
	point_list.push_front(global_position)
	old_position = global_position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	frame_timer += 1
	if frame_timer == frame_gap :
		frame_timer = 0
		point_list.push_front(global_position)
		if point_list.size() >= num_segments :
			point_list.pop_back()
	update()
	pass
	
func _draw():
	for i in point_list.size() - 1:
		if i!=0:
			var p1 = point_list[i] - global_position
			var p2 = point_list[i-1] - global_position
			print(p1,p2)
			#draw_line(p1, p2, Color.white, 2)
	pass
