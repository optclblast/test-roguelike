class_name Hero extends Entity

const _DEFAULT_INVENTORY_SIZE = 9

var inventory: Array[Item]

var inventory_size: int = _DEFAULT_INVENTORY_SIZE

func pick_item(item: Item) -> bool:
	if item.is_stackable():
		for i in self.inventory:
			if i.id == item.id:
				i.count += 1
				return true
	
	if inventory.count(Item):
		return false 

	inventory.append(Item)
	
	return true 