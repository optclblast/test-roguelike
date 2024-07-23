class_name MeleeAction extends ActionWithDirection 

func perform() -> void:
	var target: Entity = self.get_blocking_entity_at_destination()
	if not target:
		return

	var damage: int = self.entity.fighter_component.power - target.fighter_component.defense  

	var attack_description: String = "%s attacks %s" % [self.entity.get_entity_name(), target.get_entity_name()]

	if damage > 0:
		attack_description += " for %d hit points." % damage 
		target.fighter_component.hp -= damage 
	else:
		attack_description += " but does no damage."

	print("%s hp: %d | %s hp: %d" % [self.entity.get_entity_name(), entity.fighter_component.hp, target.get_entity_name(), target.fighter_component.hp])

	print(attack_description)
