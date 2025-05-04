class_name PlayerDashState
extends PlayerState

@export var IdleState: PlayerIdleState
@export var MoveState: PlayerMovingState

@export var dash_time_length := 0.5
var dash_time: float

func enter_state(player_node: Player):
	super(player_node)
	dash_time = dash_time_length

func handle_process(delta: float):
	if dash_time <= 0:
		exit_state()
	else:
		dash_time -= delta

func exit_state():
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	if direction == Vector2.ZERO:
		player.change_state(IdleState)
	else: 
		player.change_state(MoveState)
