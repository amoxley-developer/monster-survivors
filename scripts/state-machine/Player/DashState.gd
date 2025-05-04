class_name PlayerDashState
extends PlayerState

@export var IdleState: PlayerIdleState
@export var MoveState: PlayerMovingState

@export var dash_time_length := .325
var dash_time: float
var last_dash_time: float

func enter_state(player_node: Player):
	super(player_node)
	last_dash_time = dash_time_length
	dash_time = dash_time_length

func handle_process(delta: float):
	if dash_time <= 0:
		exit_state()
	else:
		handle_movement(delta)

func handle_movement(delta: float):
	dash_time -= delta
	
	# Calculate dash distance formula: Distance Traveled = ((last dash time - current dash time)/total dash time) * Dash Distance
	var elapsed_dash_time := last_dash_time - dash_time
	var dash_distance = (elapsed_dash_time/dash_time_length) * player.total_dash_distance
	last_dash_time = dash_time
	player.velocity = player.last_direction * dash_distance
	player.move_and_collide(player.velocity)
	

func exit_state():
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	if direction == Vector2.ZERO:
		player.change_state(IdleState)
	else: 
		player.change_state(MoveState)
