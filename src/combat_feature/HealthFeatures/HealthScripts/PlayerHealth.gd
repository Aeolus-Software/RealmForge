class_name PlayerHealth extends Health

signal player_die()

func _ready() -> void:
	max_health = VariationConfigs.player_starting_health
	current_health = max_health

func _die() -> void:
	player_die.emit()
