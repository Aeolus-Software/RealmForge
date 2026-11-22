extends Control

func return_to_debug() -> void:
	get_tree().change_scene_to_packed(load("res://game.tscn"))

func _on_player_health_config_player_starting_health_edited(health: int) -> void:
	VariationConfigs.player_starting_health = health

func _on_combat_ui_config_combat_ui_type_edited(ui_type: VariationConfigs.CombatUIType) -> void:
	VariationConfigs.selected_combat_ui = ui_type
