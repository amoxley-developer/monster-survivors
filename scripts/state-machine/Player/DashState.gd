class_name PlayerDashState
extends PlayerState

@export var dash_time_length := 0.5


func enter_state(player_node: Player):
	super(player_node)

func handle_process(delta: float):
	pass
