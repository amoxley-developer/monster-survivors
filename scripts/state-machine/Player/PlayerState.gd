class_name PlayerState
extends Node

var player: Player
# give this a cardinal direction, should be down

func enter_state(player_node: Player):
	player = player_node

func exit_state():
	pass

func handle_input(delta: float):
	pass
