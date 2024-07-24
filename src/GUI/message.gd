class_name Message extends Label

const base_label_settings: LabelSettings = preload("res://assets/resources/message_label_settings.tres")

var plain_text: String 
var count: int = 1:
	set(value):
		count = value 
		text = full_text() 
		
func _init(msg_text: String, foreground_color) -> void: 
	self.plain_text = msg_text 
	
	self.label_settings = base_label_settings.duplicate()
	self.label_settings.font_color = foreground_color
	
	self.text = self.plain_text 
	self.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	
func full_text() -> String:
	if self.count > 1:
		return "%s (x%d)" % [plain_text, count]
	return plain_text 
