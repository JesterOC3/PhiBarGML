/** Add this section back into the project to change the scaling mode by pressing the space bar

// Switch between scale modes
if (keyboard_check_pressed(vk_space)
	&& ++scale_mode >= SCALE_MODE.SIZE)
{
	scale_mode = 0;
}
**/

// Get camera from view 0
var _camera = view_get_camera(0);

// Compute wallpaper scaling based on the mode used
var _window_width;
var _window_height;

if ((os_type == os_operagx) && (GM_build_type == "run"))
{
	var _position = application_get_position();
	_window_width = _position[2] // - _position[0];
	_window_height = _position[3] // - _position[1];
}
else
{
	_window_width = browser_width;
	_window_height = browser_height;
}

var _scale_x = 1;
var _scale_y = 1;

switch (scale_mode)
{
	case SCALE_MODE.NO_SCALE:
		if (_window_width > wallpaper_width || _window_height > wallpaper_height)
		{
			_scale_x = max(_window_width / wallpaper_width, _window_height / wallpaper_height);
			_scale_y = _scale_x;
		}
		break;

	case SCALE_MODE.SCALE:
		_scale_x = max(_window_width / wallpaper_width, _window_height / wallpaper_height);
		_scale_y = _scale_x;
		break;

	case SCALE_MODE.STRETCH:
		_scale_x = _window_width / wallpaper_width;
		_scale_y = _window_height / wallpaper_height;
		break;

	default:
		break;
}

// Wallpaper size after scaling
var _width_scaled = wallpaper_width * _scale_x;
var _height_scaled = wallpaper_height * _scale_y;

// Position wallpaper based on focus coordinates
var _x = round((_width_scaled - _window_width) * focus_x);
var _y = round((_height_scaled - _window_height) * focus_y);

// Apply new camera position and size
camera_set_view_pos(_camera, _x / _scale_x, _y / _scale_y);
camera_set_view_size(_camera, _window_width / _scale_x, _window_height / _scale_y);

// Enable view 0
view_visible[0] = true;
view_enabled = true;

// We need to change the room size too to cover the entire window in Opera GX!
room_width = _window_width;
room_height = _window_height;

// Compute new application surface size
var _surface_width = floor(_window_width * render_scale);
var _surface_height = floor(_window_height * render_scale);

// Also required in Opera GX!
if (os_type == os_operagx)
{
	window_set_size(_surface_width, _surface_height);
}

// Apply render scale
if (surface_get_width(application_surface) != _surface_width
	|| surface_get_height(application_surface) != _surface_height)
{
	surface_resize(application_surface, _surface_width, _surface_height);
}
