extends RigidBody2D
var explosion = load("res://explosion.tscn")
signal player_died
export (int) var engine_thrust
export (int) var spin_thrust
var plBeam := preload("res://beam2.tscn")
onready var firingcooldown := $firingcooldown

export var fireDelay: float = 0.5
export var life: int = 1


var thrust = Vector2()
var rotation_dir = 0
var screensize
var ani

func _ready():
	screensize = get_viewport().get_visible_rect().size

func get_input():
	if Input.is_action_pressed("ui_w"):
		thrust = Vector2(engine_thrust, 0)
		ani="Thrust"
		var audionode = $"move"
		audionode.play()
	elif Input.is_action_just_released("ui_w"):
		var audionode = $"move"
		audionode.stop()
	else:
		thrust = Vector2()
		ani="Steady"
	rotation_dir = 0
	if Input.is_action_pressed("ui_d"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_a"):
		rotation_dir -= 1

func _process(delta):
	get_input()
	get_node("Label").text = str(life)
	$AnimatedSprite.animation = ani
	if Input.is_action_pressed("ui_s") and firingcooldown.is_stopped():
		firingcooldown.start(fireDelay)
		var beam := plBeam.instance()
		beam.position = position
		get_tree().current_scene.add_child(beam)
		beam.startat(get_rotation(), get_position())

func _physics_process(delta):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(rotation_dir * spin_thrust)
func damage(damage:int):
	life-=damage
	$AnimatedSprite.play("Damage")
	var dam = $"damage"
	dam.play()
	if life==0:
		var xplo = $"explo"
		xplo.play()
		var explo = explosion.instance()
		explo.position = self.position
		get_parent().add_child(explo)
		explo.emitting = true
		emit_signal("player_died")
		queue_free()

