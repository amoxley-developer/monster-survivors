class_name PlayerMovingState
extends PlayerState

@export var SPEED := 25
@export var IdleState: PlayerIdleState

func enter_state(player_node: Player):
	super(player_node)
	

func handle_process(delta: float):
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	handle_movement(direction, delta)

func handle_movement(direction: Vector2, delta: float):
	player.velocity = direction * SPEED * delta
	# handle diagonal movement
	match direction:
		Vector2.LEFT:
			player.cardinal_direction = player.CardinalDirection.LEFT
		Vector2.RIGHT:
			player.cardinal_direction = player.CardinalDirection.RIGHT
		Vector2.UP:
			player.cardinal_direction = player.CardinalDirection.UP
		Vector2.DOWN:
			player.cardinal_direction = player.CardinalDirection.DOWN
		Vector2.ZERO:
			player.change_state(IdleState)

	handle_animation()
	player.move_and_collide(player.velocity)

func handle_animation():
	pass
