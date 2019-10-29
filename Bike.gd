extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _ready():

	var points = PoolVector2Array([
		Vector2(-15, -7),
		Vector2(15, 0),
		Vector2(15, 7),
		Vector2(-15, 7)
	])
	
	var polygon = Polygon2D.new()
	polygon.polygon = points

	var shape = RectangleShape2D.new()
	shape.extents = Vector2(15, 5)

	var collision_shape = CollisionShape2D.new()
	collision_shape.shape = shape
	
	self.add_child(polygon)
	self.add_child(collision_shape)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		self.apply_torque_impulse(10)
		
	if Input.is_action_pressed("ui_left"):
		self.apply_torque_impulse(-10)
			