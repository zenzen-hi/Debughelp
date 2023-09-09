extends Area2D

@export var speed: int = 4000
var direction: Vector2 = Vector2.UP
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if body.has_method("hit"):
#	if "hit" in body:#methods and properties
		body.hit()
	queue_free()


func _on_timeout_timeout():
	queue_free()
