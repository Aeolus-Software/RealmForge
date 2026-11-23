class_name EnemyHealth extends Health

func _die() -> void:
	print("Entity has died")
	queue_free()
