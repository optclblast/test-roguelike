class_name Game extends Node2D

const player_definition: EntityDefinition = preload("res://assets/definitions/entities/actors/entity_definition_player.tres")
const tile_size = 16

@onready var player: Entity
@onready var event_handler: InputHandler = $InputHandler
@onready var map: Map = $Map
@onready var camera: Camera2D = $Camera2D


func _ready() -> void:
	player = Entity.new(null, Vector2i.ZERO, player_definition)
	
	remove_child(camera)
	player.add_child(camera)
	
	map.generate(player)
	map.update_fov(player.grid_position)

func _physics_process(_delta: float) -> void:
	var action: Action = event_handler.get_action(player)
	if action:
		action.perform()
		_handle_enemy_turns()
		map.update_fov(player.grid_position)


func _handle_enemy_turns() -> void:
	for entity in get_map_data().entities:
		if entity.is_alive() && entity != player:
			entity.ai_component.perform()
	# TODO move or attack or do whatever enemies do???

func get_map_data() -> MapData:
	return map.map_data
