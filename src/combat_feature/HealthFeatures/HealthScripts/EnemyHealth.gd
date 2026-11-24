class_name EnemyHealth extends Health

func _ready() -> void:
	max_health = 100
	current_health = max_health

func _die() -> void:
	print("Entity has died")
	queue_free()
