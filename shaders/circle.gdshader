shader_type canvas_item;

uniform vec4 inside_color : source_color;
uniform vec4 outline_color : source_color;
uniform float outline_thickness;
uniform float wave_size;
uniform float wave_frequency;

void fragment() {
	float a = atan(UV.y, UV.x);
	float variance = sin(a * wave_frequency + TIME) * wave_size;
	float dist = distance(UV, vec2(0.5)) + variance;
	float inside_value = 1.0 - step(0.5 - outline_thickness - wave_size, dist);
	float outline_value = (1.0 - step(0.5 - wave_size, dist)) * (1.0 - inside_value);
	vec4 color = inside_value * inside_color + outline_value * outline_color;
	COLOR = color;
}