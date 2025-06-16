class_name EnemyPossumMoveState
extends EnemyPossumState

@export var animation: AnimatedSprite2D

func enter_state(enemy_possum_node: EnemyPossum):
	super(enemy_possum_node)
	animation.play('walk')
	
func handle_process(delta: float):
	var player_position = enemy_possum.player.position
	var direction = (player_position - enemy_possum.position).normalized();

	enemy_possum.velocity = direction * enemy_possum.move_speed * delta
	var collision = enemy_possum.move_and_collide(enemy_possum.velocity)
	if not collision:
		if direction.x > 0:
			animation.flip_h = true
		else:
			animation.flip_h = false

func exit_state():
	animation.pause()
