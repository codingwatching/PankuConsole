extends Node


@export var source:Node = self

func _to_string():
	if get_script():
		return get_script().resource_path
	return "???"

@export_group("Window Appearance")

@export var blur_effect:bool = true:
	set(v):
		Console._full_repl.material.set("shader_parameter/lod", 4.0 if v else 0.0)
	get:
		return Console._full_repl.material.get("shader_parameter/lod") > 0.0

@export var base_color:Color = Color(0.0, 0.0, 0.0, 0.1):
	set(v):
		Console._full_repl.material.set("shader_parameter/modulate", v)
	get:
		return Console._full_repl.material.get("shader_parameter/modulate")

@export_group("REPL")

@export var export_button_clear_repl_output = "Clear REPL Output"
@export var freeze_when_popup:bool = true:
	set(v):
		Console.pause_when_active = v
	get:
		return Console.pause_when_active
@export var mini_mode:bool = false:
	set(v):
		Console.mini_repl_mode = v
	get:
		return Console.mini_repl_mode
@export var init_expression:String = "":
	set(v):
		Console.init_expression = v
	get:
		return Console.init_expression

@export_group("Tools")
@export var export_button_add_profiler_widget := "Add Profiler Monitor"
@export var export_button_open_expression_key_mapper := "Open Expression Key Mapper"
@export var output_overlay:bool = true:
	set(v):
		output_overlay = v
		Console.output_overlay.visible = v
	get:
		return Console.output_overlay.visible
@export_range(0.0, 1.0, 0.01) var output_overlay_alpha:float = 0.5:
	set(v):
		Console.output_overlay.modulate.a = v
	get:
		return Console.output_overlay.modulate.a
@export_range(8, 24) var output_overlay_font_size:int = 16:
	set(v):
		Console.output_overlay.theme.default_font_size = v
	get:
		return Console.output_overlay.theme.default_font_size
@export var output_overlay_font_shadow:bool = false:
	set(v):
		var val = Color.BLACK if v else null
		Console.output_overlay.set("theme_override_colors/font_shadow_color", val)
	get:
		return Console.output_overlay.get("theme_override_colors/font_shadow_color") != null

@export_group("About")
@export var export_button_show_intro := "Show Intro"
@export var export_button_check_update := "Check Update"
@export var export_button_report_bugs := "Report Bugs"
@export var export_button_suggest_features := "Suggest Features"

#export button callbacks

func clear_repl_output():
	Console.execute("console.cls")

func add_profiler_widget():
	Console.execute("widgets.profiler")

func open_expression_key_mapper():
	Console.exp_key_mapper.centered()
	Console.exp_key_mapper.move_to_front()
	Console.exp_key_mapper.show()

func show_intro():
	Console.show_intro()

func check_update():
	Console.execute("console.check_update")

func report_bugs():
	OS.shell_open("https://github.com/Ark2000/PankuConsole/issues")

func suggest_features():
	OS.shell_open("https://github.com/Ark2000/PankuConsole/issues")