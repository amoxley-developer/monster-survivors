class_name PlayerMovingState
extends PlayerState

@export var IdleState: PlayerIdleState
@export var DashState: PlayerDashState

func enter_state(player_node: Player):
	super(player_node)

func handle_process(delta: float):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	if Input.is_action_pressed("dash") and player.can_player_dash:
		player.change_state(DashState)
	elif direction == Vector2.ZERO:
		player.change_state(IdleState)
	else:
		handle_movement(direction, delta)
		play_animation()

func handle_movement(direction: Vector2, delta: float):
	player.velocity = direction * player.walk_speed * delta

	var vertical_direction := '' 
	var horizontal_direction := ''
	if abs(player.velocity.y) > 0:
		if player.velocity.y > 0:
			vertical_direction = "Down"
		else:
			vertical_direction = "Up"
	if abs(player.velocity.x) > 0: 
		if player.velocity.x > 0:
			horizontal_direction = "Right"
		else:
			horizontal_direction = "Left"
	var player_direction := vertical_direction + horizontal_direction
	player.cardinal_direction = player.CardinalDirections.get(player_direction)

	player.move_and_collide(player.velocity)

func play_animation():
	var player_direction := get_animation_direction()

	player.PlayerAnimation.play('walk-' + player_direction)
