extends VBoxContainer

var _player_starting_health: int = VariationConfigs.player_starting_health
signal player_starting_health_edited(health: int)

@onready var player_health_slider: HSlider = $PlayerHealthControlContainer/PlayerHealthSlider
@onready var player_health_spinbox: SpinBox = $PlayerHealthControlContainer/PlayerHealthSpinbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_player_starting_health = VariationConfigs.player_starting_health
	player_health_slider.set_value_no_signal(_player_starting_health)
	player_health_spinbox.set_value_no_signal(_player_starting_health)
	player_health_slider.share(player_health_spinbox)
	player_health_slider.value_changed.connect(_on_player_health_slider_value_changed)

func _on_player_health_slider_value_changed(value: float) -> void:
	_player_starting_health = int(value)
	player_starting_health_edited.emit(_player_starting_health)
