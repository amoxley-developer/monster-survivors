class_name PlayerMovingState
extends PlayerState

@export var SPEED := 25
@export var IdleState: PlayerIdleState

func enter_state(player_node: Player):
	super(player_node)
	

func handle_process(delta: float):
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	handle_movement(direction, delta)
	handle_animation()

func handle_movement(direction: Vector2, delta: float):
	player.velocity = direction * SPEED * delta
	if direction == Vector2.ZERO:
		player.change_state(IdleState)

	# Player direction handled like this so it will assign up or down direction when moving diagonally
	var player_direction := '' 
	if abs(player.velocity.y) > 0:
		if player.velocity.y > 0:
			player_direction = "DOWN"
		else:
			player_direction = "UP"
	else: 
		if player.velocity.x > 0:
			player_direction = "RIGHT"
		else:
			player_direction = "LEFT"
	player.cardinal_direction = player.CardinalDirections.get(player_direction)

	player.move_and_collide(player.velocity)

func handle_animation():
	pass
