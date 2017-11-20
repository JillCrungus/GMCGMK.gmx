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
    v_vPosition = in_Position.xyz;
    v_vNormal = in_Normal;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;//Texture coordinates
varying vec4 v_vColour;//Vertex color
varying vec3 v_vPosition;//Vertex position
varying vec3 v_vNormal;//Vertex normals

#define LN 8 //Number if lights
uniform sampler2D normal;//normalmap
uniform vec3 ambience;//r,g,b for the ambient color
uniform float light[LN*4];//x,y,z, and range for lights
uniform float lcolor[LN*3];//r,g,b for lights

vec4 lighting(vec3 pos,vec4 col,vec3 norm,vec3 lpos,float lrange, vec3 lcol)
{
    vec3 N = normalize(lpos-pos);//Light vector
    float L = max(1.0-length(pos-lpos)/lrange,0.0);//Light range
    return vec4(col.rgb * lcol * L * max(dot(norm,N),0.0),col.a);//Brightness calculation
}
void main()
{
    vec4 Col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//Pixel color
    vec3 norm = normalize(texture2D(normal,v_vTexcoord).rgb*-2.0+1.0);
    vec4 total;
    for(int i = 0;i < LN;i++)//Loop for all lights
    {
        total += lighting(v_vPosition, Col,reflect(-v_vNormal, norm),vec3(light[i*4],light[i*4+1],light[i*4+2]),light[i*4+3],
        abs(vec3(lcolor[i*3],lcolor[i*3+1],lcolor[i*3+2])));      
    }
    gl_FragColor = clamp(total,vec4(ambience,Col.a),vec4(vec3(1.0),Col.a));
}

