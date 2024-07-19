class_name ItemDefinition extends Resource 

@export_category("Visuals")

@export var texture: AtlasTexture
@export_color_no_alpha var color_lit: Color = Color.WHITE 
@export_color_no_alpha var color_dark: Color = Color.WHITE

@export_category("Mechanics")

@export var is_equipable: bool = true 
@export var is_usable: bool = true 
