extends Control

onready var _resolution = $Panel/VBoxContainer/MarginContainer/VBoxContainer/ResolutionContainer/Option_Resolution
var resolutions_variants = {
	"640x480": Vector2(640, 480),
	"800x600": Vector2(800, 600),
	"1280x720": Vector2(1280, 720),
	"1366x768": Vector2(1366, 768),
	"1440x900": Vector2(1440, 900),
	"1600x900": Vector2(1600, 900),
	"1920x1080": Vector2(1920, 1080),
}
var _tmp_resolution = 0
func set_tmp_resolution(idx):
	_tmp_resolution = idx

func _ready():
	for _res in resolutions_variants:
		_resolution.add_item(_res)
		pass
	_resolution.select(1)
	_resolution.connect("item_selected", self, "set_tmp_resolution")
	$"%Button_Save".connect("button_down", self, "_on_confirmation")
	$"%Button_Return".connect("button_down", self, "_on_return")
	pass

func _on_confirmation():
	Global.SETTINGS.resolution = resolutions_variants.values()[_tmp_resolution]
	Global.SETTINGS.save_settings()
	hide()
	pass

func _on_return():
	_tmp_resolution = 0
	hide()
	pass


func _on_CB_FS_toggled(button_pressed):
	OS.set_window_fullscreen(button_pressed)
