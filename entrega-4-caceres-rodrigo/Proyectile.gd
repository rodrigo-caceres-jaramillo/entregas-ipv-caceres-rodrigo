extends Sprite
class_name Projectile

var direction:Vector2

signal delete_request(projectile)

func _ready():
	set_physics_process(false)
	
func set_starting_values(starting_position:Vector2, direction:Vector2):
	global_position = starting_position
	self.direction = direction
	$Timer.start()
	set_physics_process(true)
	

func _physics_process(delta):
	position += direction*70*delta


func _on_Timer_timeout():
	emit_signal("delete_request", self)
