attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                    // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

uniform vec3 lightPosition;
uniform vec4 lightColour;
uniform float lightRange;

uniform float customAlpha;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
	
	vec4 lightAmbient = vec4(0.3, 0.3, 0.3, 1.0);
	
	vec3 worldPosition = (gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1.0)).xyz;
	vec3 worldNormal = normalize(gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.0)).xyz;
	vec3 lightDir = worldPosition - lightPosition;
	float lightDist = length(lightDir);
	float att = max((lightRange-lightDist)/lightRange, 0.0);

	
	lightDir = normalize(-lightDir);
	float lightAngleDifference = max(dot(worldNormal, lightDir), 0.0);
	
    v_vColour = in_Colour * (lightAmbient + att * lightColour * lightAngleDifference);
	
	v_vColour.a = (customAlpha == -1.0) ? in_Colour.a : customAlpha;
	
    v_vTexcoord = in_TextureCoord;
}
