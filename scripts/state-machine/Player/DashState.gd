class_name PlayerDashState
extends PlayerState

@export var IdleState: PlayerIdleState
@export var MoveState: PlayerMovingState

@export var dash_time_length := .325
var dash_time: float
var last_dash_time: float
var direction: Vector2

func enter_state(player_node: Player):
	super(player_node)
	last_dash_time = dash_time_length
	dash_time = dash_time_length
	set_direction()
	handle_animation()

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
	player.velocity = direction * dash_distance
	player.move_and_collide(player.velocity)
	
func handle_animation():
	var animation_direction := get_animation_direction()
	player.PlayerAnimation.play('dash-' + animation_direction)

func exit_state():
	player.can_player_dash = false
	player.start_dash_delay_timer()
	var input_direction = Input.get_vector('left', 'right', 'up', 'down')
	if input_direction == Vector2.ZERO:
		player.change_state(IdleState)
	else: 
		player.change_state(MoveState)

func set_direction():
	var input_direction := Input.get_vector('left', 'right', 'up', 'down')
	if input_direction != Vector2.ZERO:
		direction = input_direction
		return
	match player.cardinal_direction:
		player.CardinalDirections.Down:
			direction = Vector2.DOWN
		player.CardinalDirections.Up:
			direction = Vector2.UP
		player.CardinalDirections.Left:
			direction = Vector2.LEFT
		player.CardinalDirections.Right:
			direction = Vector2.RIGHT
		player.CardinalDirections.DownLeft:
			direction = Vector2(-1, 1).normalized()
		player.CardinalDirections.DownRight:
			direction = Vector2(1, 1).normalized()
		player.CardinalDirections.UpLeft:
			direction = Vector2(-1, -1).normalized()
		player.CardinalDirections.UpRight:
			direction = Vector2(1, -1).normalized()
	
