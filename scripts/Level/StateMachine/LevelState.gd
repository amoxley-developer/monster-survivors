class_name LevelState
extends Node

var level: Level

func enter_state(level_node: Level) -> void:
	level = level_node

func exit_state():
	pass

func handle_process(delta: float) -> void:
	pass
