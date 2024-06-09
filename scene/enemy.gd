extends CharacterBody2D
@onready var player = get_node("/root/main/player")

func _physics_process(delta):
	if is_instance_valid(player):
		velocity = position.direction_to(player.position) * 100
		move_and_slide()


func _on_enemy_hurtbox_area_entered(area):
	if area.name != "enemy_hurtbox":
		queue_free()
