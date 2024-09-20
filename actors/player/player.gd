extends CharacterBody2D

@export var projectile_scene: Resource
@export var power_projectile_scene: Resource
@export var move_speed: float = 200.0

var charging = false
var charge_start_time : float

func _input(event):
	if (event is InputEventMouseButton):
		# Only shoot on left click pressed down
		if (event.button_index == 1 and event.is_pressed()):
			var new_projectile = projectile_scene.instantiate()
			get_parent().add_child(new_projectile)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_projectile.fire(projectile_forward, 500.0)
			new_projectile.position = $ProjectileRefPoint.global_position
			
	if event.is_action_pressed("charge_shot") and charging == false: 
		charging = true 
		charge_start_time = 2
		
	if event.is_action_released("charge_shot") and charge_start_time <= 0:
		charging = false
		var new_projectile = power_projectile_scene.instantiate()
		get_parent().add_child(new_projectile)
		
		var projectile_forward = position.direction_to(get_global_mouse_position())
		new_projectile.fire(projectile_forward, 400.000)
		new_projectile.position = $ProjectileRefPoint.global_position
		
	if event.is_action_released("charge_shot") and charge_start_time > 0:
		charging = false 
		var new_projectile = projectile_scene.instantiate()
		get_parent().add_child(new_projectile)
		
		var projectile_forward = position.direction_to(get_global_mouse_position())
		new_projectile.fire(projectile_forward, 500.0)
		new_projectile.position = $ProjectileRefPoint.global_position
		
	if Input.is_key_pressed(KEY_F):
		var projectile_forward = position.direction_to(get_global_mouse_position())
		fire_bullet(projectile_forward.rotated(30))
		fire_bullet(projectile_forward.rotated(60))
		fire_bullet(projectile_forward.rotated(90))
		fire_bullet(projectile_forward.rotated(120))
		fire_bullet(projectile_forward.rotated(150))
		fire_bullet(projectile_forward.rotated(180))
		fire_bullet(projectile_forward.rotated(210))
		fire_bullet(projectile_forward.rotated(240))
		fire_bullet(projectile_forward.rotated(270))
		fire_bullet(projectile_forward.rotated(300))
		fire_bullet(projectile_forward.rotated(330))
		fire_bullet(projectile_forward.rotated(360))
		# PUT THIS IN A FOR LOOP LATER PLEASE!
		
		
		
func fire_bullet(direction : Vector2): 
	var new_projectile = projectile_scene.instantiate()
	new_projectile.position = $ProjectileRefPoint.global_position
	new_projectile.fire(direction, 500.00)
	get_parent().add_child(new_projectile)

func _physics_process(delta):
	# look_at(get_viewport().get_mouse_position())
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * move_speed
	move_and_slide()
	
	if (charging):
		charge_start_time -= delta
	
	# Math to sort our direction and animation 
	var angle = rad_to_deg(velocity.angle()) + 180
	
	if (velocity.length() < 10):
		$AnimationPlayer.play("idle_front")
	else:
		if (angle > 135 and angle < 225):
			$AnimationPlayer.play("walk_right")
		elif (angle > 225 and angle <315):
			$AnimationPlayer.play("walk_front")
		elif (angle > 315 or angle <45):
			$AnimationPlayer.play("walk_left")
		elif (angle > 45 and angle < 135):
			$AnimationPlayer.play("walk_up")
