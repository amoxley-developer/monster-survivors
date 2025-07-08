class_name EnemyPossumDeadState
extends EnemyPossumState

@export var animation: AnimatedSprite2D

var timer = Timer.new()

func enter_state(enemy_possum_node: EnemyPossum):
	super(enemy_possum_node)
	# freeze the animation
	animation.stop()

	# create death timer
	timer.connect('timeout', _on_timeout)
	timer.wait_time = 1
	timer.one_shot = true
	add_child(timer)
	# start timer
	timer.start()

func _on_timeout():
	# remove the node from the game
	enemy_possum.queue_free()
