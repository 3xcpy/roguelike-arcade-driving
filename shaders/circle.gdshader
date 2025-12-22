shader_type canvas_item;

uniform vec4 inside_color : source_color;
uniform vec4 outline_color : source_color;
uniform float outline_thickness;

void fragment() {
	float dist = distance(UV, vec2(0.5));
	float inside_value = 1.0 - step(0.5 - outline_thickness, dist);
	float outline_value = (1.0 - step(0.5, dist)) * (1.0 - inside_value);
	vec4 color = inside_value * inside_color + outline_value * outline_color;
	COLOR = color;
}