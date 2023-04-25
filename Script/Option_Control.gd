extends Control

onready var _resolution = $Panel/VBoxContainer/MarginContainer/VBoxContainer/ResolutionContainer/Option_Resolution
var resolutions_variants = {
	"1280x720": Vector2(1280, 720),
	"1440x900": Vector2(1440, 900),
}
var _tmp_resolution
func set_tmp_resolution(idx):
	_tmp_resolution = idx

func _ready():
	for _res in resolutions_variants:
		_resolution.add_item(_res)
		pass
	_resolution.connect("item_selected", self, "set_tmp_resolution")
	$"%Button_Save".connect("button_down", self, "_on_confirmation")
	$"%Button_Return".connect("button_down", self, "_on_return")
	pass

func _on_confirmation():
	Global.SETTINGS.resolution = resolutions_variants.values()[_tmp_resolution]
	Global.SETTINGS.save_settings()
	pass

func _on_return():
	_tmp_resolution = null
	hide()
	pass
