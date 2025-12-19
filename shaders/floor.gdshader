shader_type canvas_item;

uniform vec2 player_pos;
uniform vec2 center;
uniform float force;

void fragment() {
	float ratio = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
	vec2 scaled_uv = (SCREEN_UV - vec2(0.5, 0.0)) / vec2(ratio, 1.0) + vec2(0.5, 0.0);
	vec2 disp = normalize(scaled_uv - center) * force;
	//vec2 new_uv = UV + sin(UV.x + TIME)/5.0 + sin(UV.y - TIME)/10.0; // cool wavy thing
	vec2 new_uv = UV - disp;
	COLOR = texture(TEXTURE, new_uv);
}