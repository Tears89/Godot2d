extends Object
class_name Settings

const DEFAULT_RESOLUTION = Vector2(1280, 720)
var resolution = DEFAULT_RESOLUTION setget set_resolution
func set_resolution(value):
	resolution = value
	if OS.is_window_fullscreen():
		Global.get_viewport().size = value
	else:
		OS.set_window_size(value)
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func save_settings():
	# Create new ConfigFile object.
	var config = ConfigFile.new()

	# Store some values.
	config.set_value("Settings", "resolution", resolution)
	config.save("user://settings.ini")

	pass

func load_settings():
	pass
