extends Node

signal action_selected(action: String)

@onready var attack_button_1: Button = $Control/MarginContainer/VBoxContainer/Action1
@onready var attack_button_2: Button = $Control/MarginContainer/VBoxContainer/Action2
@onready var heal_button: Button = $Control/MarginContainer/VBoxContainer/Action3
@onready var block_button: Button = $Control/MarginContainer/VBoxContainer/Action4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func return_to_debug() -> void:
	print("returning to debug menu")
	get_tree().change_scene_to_packed(load("res://game.tscn"))

func set_input_enabled(enabled):
	if enabled:
		print("Player Turn")
	attack_button_1.disabled = not enabled
	attack_button_2.disabled = not enabled
	heal_button.disabled = not enabled
	block_button.disabled = not enabled

func _on_action_1_button_up():
	action_selected.emit("Attack 1")


func _on_action_2_button_up():
	action_selected.emit("Attack 2")


func _on_action_3_button_up():
	action_selected.emit("Heal")


func _on_action_4_button_up():
	action_selected.emit("Block")
