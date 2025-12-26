shader_type canvas_item;

uniform float slash_start;
uniform float slash_length;
uniform vec4 color : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 centered_uv = (UV - vec2(0.5)) * 2.0;
	float a = atan(centered_uv.y, centered_uv.x);
	float filter = (1.0 - step(a + 1.0, a)) * (1.0 - step(slash_start, a));
	COLOR = vec4(color * filter);
}