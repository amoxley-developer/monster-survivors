class_name EnemyZombie
extends CharacterBody2D

var CurrentState: EnemyZombieState

func change_state(new_state: EnemyZombieState):
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)

func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.handle_process(delta)
