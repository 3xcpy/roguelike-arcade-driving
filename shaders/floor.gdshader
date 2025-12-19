shader_type canvas_item;

uniform vec2 player_pos;

void fragment() {
	vec2 new_uv = UV;
	COLOR = texture(TEXTURE, new_uv);
}