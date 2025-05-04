class_name PlayerState
extends Node

var player: Player

func enter_state(player_node: Player):
	player = player_node

func exit_state():
	pass

func handle_process(delta: float):
	pass
