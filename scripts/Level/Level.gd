class_name Level
extends Node2D

@export var SetupState: LevelSetupState
var CurrentState: LevelState

func _ready() -> void:
	pass
	
func change_state(new_state: LevelState) -> void:
	CurrentState = new_state
	
