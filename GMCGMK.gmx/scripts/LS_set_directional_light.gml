///LS_set_directional_light(directional light id,x,y,z,color)
var i,X,Y,Z;
i = argument0;
X = argument1;
Y = argument2;
Z = argument3;
c = argument4;

//LSnum = i;
LSdpos[i*3] = X;
LSdpos[i*3+1] = Y;
LSdpos[i*3+2] = Z;
LSdcol[i*3] = colour_get_red(c)/255;
LSdcol[i*3+1] = colour_get_green(c)/255;
LSdcol[i*3+2] = colour_get_blue(c)/255;