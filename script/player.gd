extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0

@export var bullet_scene: PackedScene = preload("res://scene/bullet.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# rotate aim based on mouse
	$aim.look_at(get_global_mouse_position())
	
	# shoot
	if Input.is_action_just_pressed("shoot"):
		shoot()
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func shoot():
	var bullet = bullet_scene.instantiate() as Area2D
	bullet.global_position = $aim.global_position
	bullet.rotation = $aim.rotation
	get_parent().add_child(bullet)
