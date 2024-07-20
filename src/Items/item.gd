# Abstract Class 
class_name Item extends RefCounted

var id: String 

# ===== ACTIONS ===== #
func pick() -> void:
	pass

func drop() -> void:
	pass 

func throw() -> void: 
	pass 

# ===== ATTRIBUTES ===== # 

func is_stackable() -> bool:
	return false