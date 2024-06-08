extends Node2D

func _process(delta: float) -> void:
	$fps.set_text("FPS: %d" % Engine.get_frames_per_second())
