extends CharacterBody2D
@onready var player = get_node("/root/main/player")
@onready var enemyTimer = get_node("/root/main/EnemySpawnTimer")

func _physics_process(delta):
	if is_instance_valid(player):
		velocity = position.direction_to(player.global_position) * 100
		move_and_slide()


func _on_enemy_hurtbox_area_entered(area):
	if area.name != "enemy_hurtbox":
		Global.ENEMIES_LEFT -= 1
		# increment level if enemy left is 0
		if Global.ENEMIES_LEFT == 0: 
			Global.LEVEL += 1
			Global.ENEMIES_LEFT = 5 * Global.LEVEL
			# run a timer to respawn next enemies
			enemyTimer.start()
		queue_free()
