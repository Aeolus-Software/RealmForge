class_name EnemyHealth extends Health

signal enemy_die()

func _ready() -> void:
	max_health = 100
	current_health = max_health

func _die() -> void:
	enemy_die.emit()
	print("Entity has died")
	queue_free()
