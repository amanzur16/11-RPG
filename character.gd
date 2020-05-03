extends KinematicBody

var gravity = -3

var velocity = Vector3()
var camera
var anim_player
var character

const SPEED = 15
const ACCELERATION = 3
const DE_ACCELERATION = 5

func _ready():
	# Called every time the node is added to the scene
	# Initializtion here
	anim_player = get_node("AnimationPlayer")
	character = get_node(".")
#func _process(delta):
#  # Called every frame. Delta is time since last frame
#  # Update game logic here.
#  pass

func _physics_process(delta):
	
	camera = get_node("target/Camera").get_global_transform()
	var dir = Vector3()
	
	var is_moving = false
	var is_attacking = false
	
	if(Input.is_action_pressed("forward")):
		dir += -camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("back")):
		dir += camera.basis[2]
		is_moving = true
	if(Input.is_action_pressed("left")):
		dir += -camera.basis[0]
		is_moving = true
	if(Input.is_action_pressed("right")):
		dir += camera.basis[0]
		is_moving = true
	if(Input.is_action_just_pressed("primary_fire")):
		is_attacking = true
		$AnimationPlayer.play("Attack_1")
			
	dir.y =0 
	dir = dir.normalized()
	
	velocity.y = delta * gravity
	
	var hv = velocity
	hv.y = 0 
	
	var new_pos = dir * SPEED
	var accel = DE_ACCELERATION
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		
		var char_rot = character.get_rotation()
		
		char_rot.y = angle
		character.set_rotation(char_rot)
	
	# Set Animation
	
	var anim_to_play = "Idle-loop"
	
	if is_moving:
		anim_to_play = "Run"

	
		
	var current_anim = anim_player.get_current_animation()
	if current_anim != anim_to_play:
		anim_player.play(anim_to_play)
		
	
	
		
