extends Node2D

const projectile = preload("res://scenes/LaserBeam.tscn")
var current_projectile = null
var firing = false
var vector : Vector2

func _ready():
	pass # Replace with function body.

func fire(vec : Vector2) :
	pass

func end_fire() :
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
