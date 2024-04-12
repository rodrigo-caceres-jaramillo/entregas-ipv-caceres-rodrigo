extends Sprite

onready var fire_position:Position2D = $FirePosition

export (PackedScene) var projectle_scene
var projectile_container:Node

func fire():
	var projectile_instance:Projectile = projectle_scene.instance()
	projectile_container.add_child(projectile_instance)
	projectile_instance.set_starting_values(fire_position.global_position, (fire_position.global_position - global_position).normalized())
	projectile_instance.connect("delete_request", self, "_on_projectile_delete_requeste")
	
func _on_projectile_delete_requeste(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
