shader_type canvas_item;

uniform vec4 color : source_color;

void fragment() {
	float dist = distance(UV, vec2(0.5));
	float value = 1.0 - step(0.5, dist);
	
	COLOR = color * value;
}