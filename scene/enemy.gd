extends CharacterBody2D
@onready var player = get_node("/root/main/player")

func _physics_process(delta):
	if is_instance_valid(player):
		velocity = position.direction_to(player.position) * 100
		move_and_slide()
