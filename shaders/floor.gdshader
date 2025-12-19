shader_type canvas_item;

uniform vec2 player_pos;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = texture(TEXTURE, UV);
}