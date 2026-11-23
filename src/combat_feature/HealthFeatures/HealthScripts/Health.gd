class_name Health extends Node2D

signal health_changed(new_health: int)
signal max_health_changed(new_max_health: int)

@export_range(60, 120) var max_health: int = 100: set = set_max_health, get = get_max_health
var current_health: int = max_health: set = set_health, get = get_current_health

func get_max_health() -> int:
	return max_health

func set_max_health(new_max_health: int) -> void:
	max_health = new_max_health
	if current_health > max_health:
		current_health = max_health
		health_changed.emit(current_health)
	max_health_changed.emit(max_health)

func get_current_health() -> int:
	return current_health

func set_health(new_health: int) -> void:
	current_health = min(max_health, new_health)
	health_changed.emit(current_health)

func _die() -> void:
	pass

func take_damage(amount: int) -> void:
	current_health = max(0, current_health - amount)
	
	if current_health == 0:
		_die()

func heal(amount: int) -> void:
	current_health = min(max_health, current_health + amount)
	

func _on_button_pressed() -> void:
	take_damage(25)

func _on_button_2_pressed() -> void:
	heal(10)
