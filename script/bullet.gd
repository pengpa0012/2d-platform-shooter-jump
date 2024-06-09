extends Area2D

var SPEED = 500

func _physics_process(delta):
	position += transform.x * SPEED * delta



func _on_area_entered(area):
	if area.name == "enemy_hurtbox":
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
