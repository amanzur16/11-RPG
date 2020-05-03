extends Label

var coins = 0

func _ready():
	text = String(coins)




func _on_coinGold_CoinCollected():
	coins = coins + 1
	_ready()
