extends RigidBody2D

var collider 

export var thrust = 10
var thrust_vector = Vector2()

var parent_rigidBody
var parent_rotation

var label

func _ready():
	
	collider = $CollisionShape2D
	collider.disabled = true
	
	thrust_vector.y = -thrust
	
	parent_rigidBody = get_parent()
	parent_rotation = parent_rigidBody.global_rotation
	
	thrust_vector = thrust_vector.rotated(parent_rotation)
	
	label = $Label

func _process(delta):
	pass

func _physics_process(delta):
	
	#label.text = str(parent_rotation)
	var offset = Vector2()
	offset *= 0
	apply_impulse(offset, thrust_vector)