class_name PlayerDashState
extends PlayerState

@export var dash_timer_length := 0.5
var dash_timer := dash_timer_length

func enter_state(player_node: Player):
	super(player_node)