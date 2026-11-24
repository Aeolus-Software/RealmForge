extends Node

var ui_config = VariationConfigs.selected_combat_ui

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("UI option ", ui_config, " Selected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func return_to_debug() -> void:
	print("returning to debug menu")
	get_tree().change_scene_to_packed(load("res://game.tscn"))
