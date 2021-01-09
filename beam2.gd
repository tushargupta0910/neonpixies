extends Area2D

var vel = Vector2()
export var speed :float=1500
func _ready():
	pass 

func startat(dir,pos):
	set_rotation(dir)
	set_position(pos)
	vel = Vector2(speed,0).rotated(dir)

func _physics_process(delta):
	set_position(get_position()+ vel *delta)




func _on_beam2_body_entered(body):
	if body.is_in_group("Boom1"):
		body.damage(1)
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
