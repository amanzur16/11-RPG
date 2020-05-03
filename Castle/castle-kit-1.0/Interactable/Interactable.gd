extends StaticBody
var gravity = -10000000000000009.8




class_name Interactable


		
func get_interaction_text():
	return "Interact"
	
func interact():
	print("Interacted with %s" % name)
