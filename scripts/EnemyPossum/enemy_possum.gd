class_name EnemyPossum
extends CharacterBody2D

var CurrentState: EnemyPossumState

func change_state(new_state: EnemyPossumState):
	CurrentState = new_state
	if CurrentState:
		CurrentState.enter_state(self)

func _process(delta: float) -> void:
	if CurrentState:
		CurrentState.handle_process(delta)
