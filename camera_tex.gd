extends TextureRect

var camera: CameraFeed

@onready var DebugLabel: Label = $"../Label"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var debug_text = "cameras:\n"
	for feed in CameraServer.feeds():
		var name = feed.get_name()
		debug_text += name + "\n"
		
		# if camera_name is left empty, use the first available camera
		if camera == null:
			camera = feed
	
	if camera == null:
		debug_text = "no cameras"
		return
	
	else:
		camera.feed_is_active = true
		
		var cam_tex_y = material.get_shader_parameter("camera_y")
		var cam_tex_CbCr = material.get_shader_parameter("camera_CbCr")
		
		cam_tex_y.camera_feed_id = camera.get_id()
		cam_tex_CbCr.camera_feed_id = camera.get_id()
		
		material.set_shader_parameter("camera_y", cam_tex_y)
		material.set_shader_parameter("camera_CbCr", cam_tex_CbCr)
	
	DebugLabel.text = str(debug_text)
	
