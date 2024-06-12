extends StaticBody2D

@onready var player = get_node("/root/main/player")

func _physics_process(delta):
	# maybe change this in the future
	if is_instance_valid(player):
		if (player.global_position.y + 5) > global_position.y:
			$CollisionShape2D.disabled = true
		else:
			$CollisionShape2D.disabled = false
