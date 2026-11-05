extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_combat_button_up() -> void:
	print("Combat button pressed")
	# This could be changed to hide and show
	get_tree().change_scene_to_packed(load("res://combat_feature/combat_screen.tscn"))

func _on_configure_button_up() -> void:
	# This could be changed to hide and show
	print("Configure button pressed")
	get_tree().change_scene_to_packed(load("res://configure_feature/configure_screen.tscn"))


func _on_ui_button_button_up():
	# This could be changed to hide and show
	print("UI button pressed")
