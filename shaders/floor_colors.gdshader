shader_type canvas_item;

uniform sampler2D gradient;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);
	float gray = (color.r + color.g + color.b) / 3.0;
	COLOR = vec4(gray, gray, 0.0, 1.0);
	
	vec2 new_uv = vec2(gray);
	vec4 gradient_color = texture(gradient, new_uv);
	COLOR = gradient_color;
}