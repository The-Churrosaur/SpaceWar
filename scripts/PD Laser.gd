extends "Weapon.gd"

onready var beam = $LaserBeam

func _ready() :
	pass

func fire(vec : Vector2) :
	vector = vec
	beam.enable()
	var angle = vec.angle() - rotation #difference in angle
	rotate(angle)
	
	firing = true
	#update()
	pass
	
func _draw():
	#draw_line(position, vector, Color.red, 2)
	pass

func end_fire() :
	beam.disable()
	firing = false
	pass

func _process(delta) :
	pass
