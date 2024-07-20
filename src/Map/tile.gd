class_name Tile extends Sprite2D 

var _definition: TileDefinition

var is_explored: bool:
	set(value):
		is_explored = value 
		if is_explored and not visible:
			self.visible = true

var is_in_view: bool:
	set(value):
		if not self.visible:
			self.visible = true

		is_in_view = value 
		self.modulate = _definition.color_lit if is_in_view else _definition.color_dark
		if is_in_view and not is_explored:
			is_explored = true

func _init(grid_position: Vector2i, tile_def: TileDefinition) -> void:
	self.centered = false 
	position = Grid.grid_to_world(grid_position) 
	set_tile_type(tile_def) 
	self.scale = Grid.DEFAULT_SCALE

func set_tile_type(tile_definition: TileDefinition) -> void:
	_definition = tile_definition
	texture = _definition.texture
	modulate = _definition.color_dark


func is_walkable() -> bool:
	return _definition.is_walkable


func is_transparent() -> bool:
	return _definition.is_transparent