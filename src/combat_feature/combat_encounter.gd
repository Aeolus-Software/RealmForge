extends Node2D

signal action_selected(action: String)

var ui_config = VariationConfigs.selected_combat_ui
var ui_scene
var ui_instance

signal enemy_targeted(health: int)
signal player_targeted(health: int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("UI option ", ui_config, " Selected")
	if ui_config == 0:
		ui_scene = load("res://combat_feature/combat_screen.tscn")
		ui_instance = ui_scene.instantiate()
	else:
		pass
	add_child(ui_instance)
	
	ui_instance.action_selected.connect(_on_action_selected)
	
func _on_action_selected(action: String) -> void:
	if action == "Attack 1":
		enemy_targeted.emit(10)
	elif action == "Attack 2":
		enemy_targeted.emit(15)
	elif action == "Heal":
		player_targeted.emit(-10)
