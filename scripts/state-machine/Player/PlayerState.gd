class_name PlayerState
extends Node

var player: Player

func enter_state(player_node: Player):
	player = player_node

func exit_state():
	pass
	
func get_animation_direction() -> String:
	var player_direction: String
	match player.cardinal_direction:
		player.CardinalDirections.Down:
			player_direction = 'down'
		player.CardinalDirections.DownLeft:
			player_direction = 'down'
		player.CardinalDirections.DownRight:
			player_direction = 'down'
		player.CardinalDirections.Up:
			player_direction = 'up'
		player.CardinalDirections.UpLeft:
			player_direction = 'up'
		player.CardinalDirections.UpRight:
			player_direction = 'up'
		player.CardinalDirections.Left:
			player_direction = 'left'
		player.CardinalDirections.Right:
			player_direction = 'right'
	return player_direction

func handle_process(_delta: float):
	pass
