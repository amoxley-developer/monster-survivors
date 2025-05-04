class_name PlayerDashState
extends PlayerState

@export var IdleState: PlayerIdleState
@export var MoveState: PlayerMovingState
@export var dash_time_length := 0.5
var dash_timer := dash_time_length

func enter_state(player_node: Player) -> void:
	super(player_node)
	# set some sort of animation here?

func handle_process(delta: float) -> void:
	if dash_timer <= 0:
		exit_state()
	else:
		handle_movement(delta)
		handle_dash_timer(delta)

func handle_movement(delta: float) -> void:
	pass

func handle_dash_timer(delta: float) -> void:
	dash_timer -= delta
	
func exit_state():
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	if direction == Vector2.ZERO:
		player.change_state(IdleState)
	else:
		player.change_state(MoveState)
