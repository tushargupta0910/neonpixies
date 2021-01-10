extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $menu/logo/centrerow/buttons.get_children():
		button.connect("pressed",self,"_on_Button_pressed",[button.scene_to_load])
		
func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
	# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.

	
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
