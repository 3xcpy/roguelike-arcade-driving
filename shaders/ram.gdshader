shader_type canvas_item;

uniform vec4 color : source_color;
uniform vec4 edge_color: source_color;
uniform float edge_thickness;

void fragment() {
	vec2 centered_uv = (UV - vec2(0.5)) * 2.0;
	float a = atan(centered_uv.x, centered_uv.y);
	float filter = step(0, a);
	float dist = distance(centered_uv, vec2(0.0));
	float dist_filter = 1.0 - step(1.0-edge_thickness, dist);
	float edge_filter = (1.0 - step(1.0, dist)) * (1.0 - dist_filter);
	COLOR = vec4(vec3(a/PI), 1.0);
	COLOR = color * filter * dist_filter + edge_color * filter * edge_filter;
}