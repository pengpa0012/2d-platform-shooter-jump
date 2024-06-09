extends Node2D

@onready var fpsUI = get_node("UI/fps")

func _process(delta: float) -> void:
	fpsUI.set_text("FPS: %d" % Engine.get_frames_per_second())
