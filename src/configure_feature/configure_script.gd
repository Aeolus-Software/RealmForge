extends Control

var _player_starting_health: int = 100

@onready var player_health_slider: HSlider = $PlayerHealthOverallContainer/PlayerHealthControlContainer/PlayerHealthSlider
@onready var player_health_spinbox: SpinBox = $PlayerHealthOverallContainer/PlayerHealthControlContainer/PlayerHealthSpinbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_health_slider.set_value_no_signal(_player_starting_health)
	player_health_spinbox.set_value_no_signal(_player_starting_health)
	player_health_slider.share(player_health_spinbox)
	player_health_slider.value_changed.connect(_on_player_health_slider_value_changed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_health_slider_value_changed(value: float) -> void:
	_player_starting_health = int(value)

func return_to_debug() -> void:
	get_tree().change_scene_to_packed(load("res://game.tscn"))
