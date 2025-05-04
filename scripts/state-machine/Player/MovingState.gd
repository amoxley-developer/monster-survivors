class_name PlayerMovingState
extends PlayerState

@export var IdleState: PlayerIdleState

func enter_state(player_node: Player):
	super(player_node)
	

func handle_process(delta: float):
	var direction = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	if direction == Vector2.ZERO:
		player.change_state(IdleState)
	else:
		handle_movement(direction, delta)
		play_animation()

func handle_movement(direction: Vector2, delta: float):
	player.velocity = direction * player.walk_speed * delta
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

func play_animation():
	player.PlayerAnimation.play('walk-' + player.cardinal_direction)
