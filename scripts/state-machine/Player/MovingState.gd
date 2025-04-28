class_name PlayerMovingState
extends PlayerState

@export var SPEED := 25

func enter_state(player_node: Player):
	super(player_node)

func handle_process(delta: float):
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	handle_movement(direction, delta)

func handle_movement(direction: Vector2, delta: float):
	player.velocity = direction * SPEED * delta
	player.move_and_collide(player.velocity)
