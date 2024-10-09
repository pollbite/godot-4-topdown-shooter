extends State

@export var chase_speed: float = 5000.0
var target : CharacterBody2D
var animation_player : AnimationPlayer

func _initialize(): 
	pass

func process_state(delta: float):
	
	if body.global_position.distance_to(target.global_position) >= body.chase_distance:
		body.velocity = (target.position - body.position).normalized() * chase_speed * delta
		body.move_and_slide()
		var animVelocity = body.velocity
		
		animation_player = body.get_node("AnimationPlayer")

		
		var angle = rad_to_deg(animVelocity.angle()) + 180
		
		if (angle > 135 and angle < 225):
			animation_player.play("walk_right")
		elif (angle > 225 and angle <315):
			animation_player.play("walk_front")
		elif (angle > 315 or angle <45):
			animation_player.play("walk_left")
		elif (angle > 45 and angle < 135):
			animation_player.play("walk_up")
