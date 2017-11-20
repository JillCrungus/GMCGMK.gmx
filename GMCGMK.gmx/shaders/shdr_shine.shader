attribute vec3 in_Position;                  // (x,y,z)
attribute vec3 in_Normal;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vPosition;
varying vec3 v_vNormal;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    v_vPosition = (gm_Matrices[MATRIX_WORLD] * object_space_pos).xyz;
    v_vNormal = (gm_Matrices[MATRIX_WORLD_VIEW] * vec4(in_Normal,0.0)).xyz;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;//Texture coordinates
varying vec4 v_vColour;//Vertex color
varying vec3 v_vPosition;//Vertex position
varying vec3 v_vNormal;//Vertex normals


void main()
{
    vec4 Col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//Pixel color
    float shine = pow(max(v_vNormal.y*2.0,0.0),4.0);
    gl_FragColor = vec4(Col.rgb*(shine*0.5+0.5)+shine,Col.a);
}

