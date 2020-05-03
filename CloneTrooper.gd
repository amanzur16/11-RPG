extends KinematicBody

onready var anim = get_node("AnimationPlayer")

func _ready():
	pass
	
func _process(delta):
		
	var target_dir = Vector2(0,0)
	if Input.is_action_pressed("forward"):
		target_dir.y += 1
	if Input.is_action_pressed("back"):
		target_dir.y -= 1
	if Input.is_action_pressed("left"):
		target_dir.y += 1
	if Input.is_action_pressed("right"):
		target_dir.y -= 1
		
	
	
	
func set_anim(dir):
	if dir == Vector2(0,0) and anim.current_animation != "cloneidle":
		anim.play("cloneidle",0.1) 
	elif dir == Vector2(0,1) and not (anim.current_animation == "forward" and anim.get_playing_speed() > 0):
		anim.play("forward",0.1)
	elif dir == Vector2(0,1)and anim.current_animation != "right":
		anim.play("right",0.1)
	elif dir == Vector2(0,1)and anim.current_animation != "left":
		anim.play("left",0.1)
	
	
		
