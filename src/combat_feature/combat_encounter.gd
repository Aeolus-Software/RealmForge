extends Node2D

signal action_selected(action: String)
signal enemy_targeted(health: int)
signal player_targeted(health: int)

var ui_config = VariationConfigs.selected_combat_ui
var ui_scene
var ui_instance

@onready var player = $Player
@onready var enemy = $Enemy

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
	enemy.enemy_action.connect(_on_enemy_action_selected)
	player.health.player_die.connect(_on_defeat)
	
func _on_action_selected(action: String) -> void:
	if action == "Attack 1":
		enemy_targeted.emit(10)
	elif action == "Attack 2":
		player_targeted.emit(15)
	elif action == "Heal":
		player_targeted.emit(-10)
		
func _on_enemy_action_selected(damage: int):
	player_targeted.emit(12)
	
func _on_defeat():
	var death_screen_scene = preload("res://combat_feature/death_screen.tscn")
	var death_screen = death_screen_scene.instantiate()
	add_child(death_screen)

	
