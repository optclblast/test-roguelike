class_name Map extends Node2D 

@export var fov_radius: int = 8

var map_data: MapData

@onready var dungeon_generator: DungeonGenerator = $DungeonGenerator
@onready var field_of_view: FieldOfView = $FOV

func generate(player: Entity) -> void:
	map_data = dungeon_generator.generate_dungeon(player)
	_place_tiles()

func update_fov(player_position: Vector2i) -> void:
	self.field_of_view.update_fov(self.map_data, player_position, self.fov_radius)

func _place_tiles() -> void:
	for tile in map_data.tiles:
		tile.visible = false
		self.add_child(tile)
