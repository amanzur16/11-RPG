extends Area

var value = 1

signal CoinCollected

func _physics_process(delta):
	rotate_y(deg2rad(3))

func _on_coinGold_body_entered(body):
	if body.name == "character":
		queue_free()
		emit_signal("CoinCollected")
