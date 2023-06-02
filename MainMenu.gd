extends Control

func _ready():
	var main_menu_button = preload("res://MainMenuButton.tscn")
	var buttons = ["Nueva partida", "Configuración", "Extras", "Salir"]
	
	for i in range(buttons.size()):
		var instance = main_menu_button.instance()
		instance.text = buttons[i]
		match i:
			0:
				instance.connect("pressed", self, "load_scene", ["res://NewGame.tscn"])
			1:
				instance.connect("pressed", self, "load_scene", ["res://Configuration.tscn"])
			2:
				instance.connect("pressed", self, "load_scene", ["res://Extras.tscn"])
			3:
				instance.connect("pressed", self, "quit")
		$CenterContainer/PanelContainer/VBoxContainer/Buttons.add_child(instance)

func load_scene(scene: String) -> void:
	var error_code = get_tree().change_scene(scene)
	if error_code != 0:
		print("Error: ", error_code)
		
func quit() -> void:
		get_tree().quit()
