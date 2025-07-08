class_name HealthBar
extends ProgressBar

var health := 0.0 : set = _set_health

func _set_health(new_health: float):
	health = min(max_value, new_health)
	value = health

func init_health(start_health: float, fill_color: Color = Color.DARK_RED):
	max_value = start_health
	value = start_health
	get("theme_override_styles/fill").bg_color = fill_color
	
