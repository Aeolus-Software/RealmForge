class_name PlayerHealth extends Health

func _ready() -> void:
	max_health = VariationConfigs.player_starting_health
	current_health = max_health

func _die() -> void:
	var death_screen_scene = preload("res://combat_feature/death_screen.tscn")
	var death_screen = death_screen_scene.instantiate()
	
	get_tree().root.add_child(death_screen)
