extends RigidBody2D

var thrust_vec = Vector2()
var thrust = Vector2()
var thrusting = false;

var rot_speed = 0;
var rot_left = false;
var rot_right = false;

export var speed = 2.0;
export var rot_force = 3500;
export var ang_clamp_mult = 700

var label
const missile_scene = preload("res://scenes/Missile.tscn")
onready var PD_weapon = $PDLaser

var gravity_target : Node2D

func _ready():
	
	thrust = thrust.normalized()
	thrust.y = - speed
	
	label = $Label

func _process(delta):
	
	if (Input.is_action_pressed("ui_up")) :
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
	if (Input.is_action_just_pressed("ui_right_mouse")) :
		var missile = missile_scene.instance()
		add_child(missile)
		#label.text = "spawned"
	
	#---------------------------------------------- laser
	if (Input.is_action_pressed("ui_left_mouse")) :
		PD_weapon.fire(get_local_mouse_position())
	
	if (Input.is_action_just_released("ui_left_mouse")) :
		PD_weapon.end_fire()
	#---------------------------------------------- thrust wash
	if thrusting :
		$ThrustWash.visible = true
	else:
		$ThrustWash.visible = false

func _input(event):
	pass

func _physics_process(delta):
	
	if (rot_left) :
		add_torque(-rot_force)
	if(rot_right) :
		add_torque(rot_force)
		
	
	var ang_clamp_force
	
	#if (abs(angular_velocity) > 2.0) : #clamp high
	#	ang_clamp_force = -angular_velocity * ang_clamp_mult * rot_force
	#	
	#elif (abs(angular_velocity) < 0.1 && !rot_left && !rot_right) : #clamp low
	#	ang_clamp_force = -angular_velocity * ang_clamp_mult * rot_force
	#	
	#else :
	#	ang_clamp_force = 0
	
	#constant damp
	ang_clamp_force = -angular_velocity * ang_clamp_mult
	
	add_torque(ang_clamp_force)
	
	apply_central_impulse(thrust_vec)
	#label.text = str(angular_velocity)

	
	
