class_name PlayerState
extends Node

var player: Player

func enter_state(player_node):
	player = player_node

func exit_state():
	pass

func handle_input(_delta: float):
	pass
