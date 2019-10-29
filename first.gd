extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	var points = PoolVector2Array()
	
	for i in range(100):
		var height = randi() % 40
		var point = Vector2(-100 + i * 20, 100 + height)
		points.append(point)
	
	$Floor/Line2D.points = points
	
	points.insert(0, Vector2(-100, 200))
	points.append(Vector2(1900, 200))
	

	$Floor/CollisionPolygon2D.polygon = points
	#shape.build_mode = shape.BUILD_SOLIDS

	#$Floor.add_child(shape)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _unhandled_input(event):
    if event is InputEventKey:
        if event.pressed and event.scancode == KEY_ESCAPE:
            get_tree().quit()
