class_name EnemyZombieState
extends Node

var enemy_zombie: EnemyZombie

func enter_state(enemy_zombie_node: EnemyZombie):
	enemy_zombie = enemy_zombie_node

func exit_state():
	pass

func handle_process(_delta: float):
	pass
