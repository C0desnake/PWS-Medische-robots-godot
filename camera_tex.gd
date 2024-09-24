extends TextureRect

var camera: CameraFeed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if CameraServer.feeds():
		camera = CameraServer.feeds()[0]
		camera.feed_is_active = true
		
		var cam_tex_y = material.get_shader_material("camera_y")
		var cam_tex_CbCr = material.get_shader_material("camera_CbCr")
		
		cam_tex_y.camera_feed_id = camera.get_id()
		cam_tex_CbCr.camera_feed_id = camera.get_id()
		
		material.set_shader_material("camera_y", cam_tex_y)
		material.set_shader_material("camera_CbCr", cam_tex_CbCr)
	
