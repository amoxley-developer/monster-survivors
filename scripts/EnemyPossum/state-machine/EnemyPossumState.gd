class_name EnemyPossumState
extends Node

var enemy_possum: EnemyPossum

func enter_state(enemy_possum_node: EnemyPossum):
	enemy_possum = enemy_possum_node

func exit_state():
	pass

func handle_process(_delta: float):
	pass
