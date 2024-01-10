enum SCALE_MODE
{
	// Keep the wallpaper the same size as long as it covers the entire
	// window. If the window is larger than the wallpaper, then the
	// wallpaper is scaled up while keeping the aspect ratio.
	NO_SCALE,
	// Scale the wallpaper to cover the entire window, while keeping the
	// aspect ratio.
	SCALE,
	// Stretch the wallpaper over the entire window, ignoring the aspect
	// ratio.
	STRETCH,
	// (total number of options in this enum)
	SIZE
};

// Scaling factor for the application surface. Lower values increase rendering
// performance but decrease quality.
render_scale = 1.0;

// The scaling mode to use to make the wallpaper cover the entire window.
// Use values from the SCALE_MODE enum. Default value is SCALE_MODE.NO_SCALE.
scale_mode = SCALE_MODE.NO_SCALE;

// The width of the wallpaper. Default value is the width of the room.
wallpaper_width = room_width;

// The height of the wallpaper. Default value is the height of the room.
wallpaper_height = room_height;

// The focus point on the X axis. Use values in range 0..1, where 0 is the left
// side of the wallpaper and 1 is the right side. Default value is 0.5 (center).
focus_x = 0.5;

// The focus point on the Y axis. Use values in range 0..1, where 0 is the top
// of the wallpaper and 1 is the bottom. Default value is 0.5 (center).
focus_y = 0.5;

// Add configuration options for game speed and render resolution
var _config =
[
	{
		type: "section",
		name: "perf",
		label: "Performance",
		children:
		[
			{
				type: "select",
				name: "speed",
				label: "Speed",
				value: "Normal",
				options: ["Low", "Normal", "Blazing"],
				description:"Performance option",
			},
			{
				type: "select",
				name: "resolution",
				label: "Resolution",
				value: "Crisp",
				options: ["Blurry", "Normal", "Crisp"],
				description: "Performance option",
			}
		]
	}
];

wallpaper_set_config(_config);

cam = view_get_camera(0);
MAIN = 0;
SECOND = 0;
function calcPhihope(_colorHue,_colorHueTwo){
	//var _Hue = color_get_hue(_colorHue);
	//var _HueTwo = color_get_hue(_colorHueTwo);
	var PhiHOPE = ((((_colorHue) + (_colorHueTwo))/1.618) div 2);
	var PhiHOPE_Part_2 = (((PhiHOPE ) * 1.618) mod 255);
	return PhiHOPE_Part_2;
}

