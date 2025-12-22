shader_type canvas_item;

uniform vec2 positions[64];
uniform int count;
uniform float weight;
uniform float falloff_distance;
uniform float falloff_variance;

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}

void fragment() {
	vec2 screen_size = 1.0 / SCREEN_PIXEL_SIZE;
	float ratio = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
	vec2 scaled_uv = (SCREEN_UV - vec2(0.5, 0.0)) / vec2(ratio, 1.0) + vec2(0.5, 0.0);
	vec2 offset = vec2(0.0);
	
	for(int i = 0; i < count; i++) {
		vec2 pos_uv = positions[i] / screen_size;
		float dist = distance(SCREEN_UV, pos_uv);
		vec2 disp = normalize(pos_uv - SCREEN_UV) * -weight;
		float falloff = clamp(1.0 - dist / falloff_distance, 0.0, 1.0) + sin(UV.x + TIME) * falloff_variance;
		offset += disp * falloff;
	}
	
	COLOR = texture(TEXTURE, UV + offset);
	//COLOR = vec4(vec3(length(offset)*2.0), 1.0);
}