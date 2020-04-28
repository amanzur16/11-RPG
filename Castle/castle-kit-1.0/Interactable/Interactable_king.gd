extends Interactable

var dialog = [
	'Help Me!',
	'My Knights have overthrown me and have taken my Gold.',
	'Eliminate them and the gold is yours!',
	'I just want my kingdom back.'
	]

var dialog_index = 0 
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog.size():
		$Label.bbcode_text = dialog[dialog_index]
	
	


