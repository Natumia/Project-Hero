class_name Door
extends Node

func open() -> void:
	get_parent().queue_free()
	
