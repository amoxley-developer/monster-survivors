class_name EnemyPossumMoveState
extends EnemyPossumState

@export var animation: AnimatedSprite2D

func enter_state(enemy_possum_node: EnemyPossum):
	super(enemy_possum_node)
	animation.play('walk')
	
func handle_process(delta: float):
	var player_position = enemy_possum.player.position
	var direction = (player_position - enemy_possum.position);

	enemy_possum.velocity = direction.normalized() * enemy_possum.move_speed * delta
	enemy_possum.move_and_collide(enemy_possum.velocity)

	# the > 1 and < -1 checks are there to stop the flickering when the sprites are on top of each other
	if direction.x > 0 and direction.x > 1:
		animation.flip_h = true
	elif direction.x < 0 and direction.x < -1:
		animation.flip_h = false

func exit_state():
	animation.pause()
