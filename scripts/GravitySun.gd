extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var gravity = 0.1 #m/s^2
var target : RigidBody2D
var area

# Called when the node enters the scene tree for the first time.
func _ready():
	#area = get_node("Area2D")
	#area.gravity_point = true
	#area.gravity_vec = position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
