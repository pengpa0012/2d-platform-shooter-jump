extends Node2D

@onready var fpsUI = get_node("UI/fps")
@onready var levelUI = get_node("UI/level")
@onready var lifeUI = get_node("UI/life")
@onready var enemyCounterUI = get_node("UI/enemy_counter")
@onready var player = get_node("player")
@onready var enemyList = get_node("enemies")
@export var enemy_scene: PackedScene = preload("res://scene/enemy.tscn")
@export var enemy_script: Script = load("res://script/enemy.gd")

func _process(delta: float) -> void:
	levelUI.set_text("Level: %d" % Global.LEVEL)
	lifeUI.set_text("Level: %d" % Global.LIFE)
	enemyCounterUI.set_text("Enemies Left: %d" % Global.ENEMIES_LEFT)
	fpsUI.set_text("FPS: %d" % Engine.get_frames_per_second())


func _on_enemy_spawn_timer_timeout():
	for n in Global.ENEMIES_LEFT:
		var enemy = enemy_scene.instantiate() as CharacterBody2D
		enemy.global_position.x = randi_range(0, get_viewport_rect().size.x)
		enemy.global_position.y = randi_range(0, get_viewport_rect().size.y)
		enemy.set_script(enemy_script)
		enemyList.add_child(enemy)
