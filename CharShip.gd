extends RigidBody2D

var thrust_vec = Vector2()
var thrust = Vector2()
var thrusting = false;

var rot_speed = 0;
var rot_left = false;
var rot_right = false;

export var speed = 0.8;
export var rot_force = 10000;
export var ang_clamp_mult = 10

var label
const missile_scene = preload("Missile.tscn")

func _ready():
	
	thrust = thrust.normalized()
	thrust.y = - speed
	
	label = $Label
	
	

func _process(delta):
	
	if (Input.is_action_pressed("ui_select")) :
		thrusting = true
		thrust_vec = thrust
	else : 
		thrusting = false
		thrust_vec *= 0
		
	thrust_vec = thrust_vec.rotated(rotation)
		
	if (Input.is_action_pressed("ui_left")) :
		rot_left = true
	else :
		rot_left = false;
	
	if (Input.is_action_pressed("ui_right")) :
		rot_right = true;
	else :
		rot_right = false;
		
	#---------------------------------------------- missiles
	if (Input.is_action_just_pressed("ui_up")) :
		var missile = missile_scene.instance()
		add_child(missile)
		#label.text = "spawned"
		
func _physics_process(delta):
	
	if (rot_left) :
		add_torque(-rot_force)
	if(rot_right) :
		add_torque(rot_force)
		
	
	var ang_clamp_force
	
	if (abs(angular_velocity) > 0.8) : #clamp high
		ang_clamp_force = -angular_velocity * ang_clamp_mult * rot_force
		
	elif (abs(angular_velocity) < 0.1 && !rot_left && !rot_right) : #clamp low
		ang_clamp_force = -angular_velocity * ang_clamp_mult * rot_force
	
	else :
		ang_clamp_force = 0
	
	add_torque(ang_clamp_force)
	
	apply_central_impulse(thrust_vec)
	#label.text = str(angular_velocity)

	
	
