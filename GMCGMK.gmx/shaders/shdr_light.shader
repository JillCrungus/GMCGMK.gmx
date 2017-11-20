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
    v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal,0.0)).xyz;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_vTexcoord;//Texture coordinates
varying vec4 v_vColour;//Vertex color
varying vec3 v_vPosition;//Vertex position
varying vec3 v_vNormal;//Vertex normals


#define LN 8 //Number of lights
#define DL 8 //Number of directional lights
uniform vec3 ambience;
uniform float light[LN*4];//x,y,z, and range for point lights
uniform float lcolor[LN*3];//r,g,b for point lights
uniform float dlight[DL*4];//x,y,z, and range for directional lights
uniform float dcolor[DL*3];//r,g,b for directional lights


vec3 lighting(vec3 pos,vec3 col,vec3 norm,vec3 lpos,float lrange, vec3 lcol)
{
    vec3 N = normalize(lpos-pos);//Light vector
    float L = max(1.0-length(pos-lpos)/lrange,0.0);//Light range


    return (col * lcol * L * pow(max(dot(norm,N),0.0),4.0));//Brightness calculation
}
vec3 dlighting(vec3 col,vec3 norm,vec3 lpos, vec3 lcol)
{
    vec3 N = normalize(lpos);//Light vector
    return (col * lcol * pow(max(dot(norm,N),0.0),4.0));//Brightness calculation
}
void main()
{
    vec4 Col = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );//Pixel color
    vec3 total;
    for(int i = 0;i < LN;i++)//Loop for all point lights
    {
        total += lighting(v_vPosition, Col.rgb,v_vNormal,vec3(light[i*4],light[i*4+1],light[i*4+2]),light[i*4+3],
        abs(vec3(lcolor[i*3],lcolor[i*3+1],lcolor[i*3+2])));      
    }
    for(int i = 0;i < DL;i++)//Loop for all directional lights
    {
        total += dlighting(Col.rgb,v_vNormal,vec3(dlight[i*3],dlight[i*3+1],dlight[i*3+2]),
        abs(vec3(dcolor[i*3],dcolor[i*3+1],dcolor[i*3+2])));      
    }
    gl_FragColor = vec4(total+ambience,Col.a);
}
