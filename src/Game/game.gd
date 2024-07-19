class_name Game extends Node2D

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/entity_definition_player.tres")
const tile_size = 16

#test 
const item_definition: EntityDefinition = preload("res://assets/definitions/entities/items/item_definition_rusty_sword.tres")

@onready var player: Entity
@onready var event_handler: EventHandler = $EventHandler
@onready var entities: Node2D = $Entities
@onready var map: Map = $Map


func _ready() -> void:
	player = Entity.new(Vector2i.ZERO, player_definition)
	entities.add_child(player)
	map.generate(player)
	
	# var npc := Entity.new(player_start_pos + Vector2i(-2, 0), player_definition)
	# npc.modulate = Color.ORANGE_RED
	# entities.add_child(npc)

	# var test_item: Entity = Entity.new(player_start_pos + Vector2i.LEFT, item_definition)
	# test_item.modulate = Color.POWDER_BLUE
	# entities.add_child(test_item)

func _physics_process(_delta: float) -> void:
	var action: Action =  self.event_handler.get_action()
	if action:
		action.perform(self, player)


func get_map_data() -> MapData:
	return map.map_data
