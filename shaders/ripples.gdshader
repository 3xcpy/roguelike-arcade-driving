shader_type canvas_item;

uniform vec2 player_pos;
uniform vec2 center;
uniform float force;
uniform float ripple_freq;
uniform float ripple_speed;
uniform float ripple_distance;

void fragment() {
	float ratio = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
	vec2 scaled_uv = (SCREEN_UV - vec2(0.5, 0.0)) / vec2(ratio, 1.0) + vec2(0.5, 0.0);
	float dist = distance(scaled_uv, center);
	float falloff = clamp(1.0 - dist/ripple_distance, 0.0, 1.0);
	float height = (sin(dist*ripple_freq - TIME*ripple_speed)/2.0+0.5)*force*falloff;
	vec2 disp = normalize(scaled_uv - center) * height;
	vec2 new_uv = UV - disp;
	COLOR = texture(TEXTURE, new_uv);
	//COLOR = vec4(vec3(height), 1.0); // visualize the height
}