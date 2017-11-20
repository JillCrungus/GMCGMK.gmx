///LS_set_point_light(point light id,x,y,z,range,color)
var i,X,Y,Z,r,c;
i = argument0;
X = argument1;
Y = argument2;
Z = argument3;
r = argument4;
c = argument5;

//LSnum = i;
LSpos[i*4] = X;
LSpos[i*4+1] = Y;
LSpos[i*4+2] = Z;
LSpos[i*4+3] = r;
LScol[i*3] = colour_get_red(c)/255;
LScol[i*3+1] = colour_get_green(c)/255;
LScol[i*3+2] = colour_get_blue(c)/255;
//Sorted coordinates
LSspos[i*4] = X;
LSspos[i*4+1] = Y;
LSspos[i*4+2] = Z;
LSspos[i*4+3] = r;
LSscol[i*3] = colour_get_red(c)/255;
LSscol[i*3+1] = colour_get_green(c)/255;
LSscol[i*3+2] = colour_get_blue(c)/255; 
