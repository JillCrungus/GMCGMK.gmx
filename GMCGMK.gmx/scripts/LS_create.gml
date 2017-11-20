///LS_create()
globalvar Ufogc,Ufogr,Ulights,Ulcolor,Ulight,Udcolor,Udlight,Uambience,LSpos,LScol,LSspos,LSscol,LSdpos,LSdcol,LSamb,LSnum,fogc,fogr,foge;
Ufogc = shader_get_uniform(shdr_light,"fogcolor");
Ufogr = shader_get_uniform(shdr_light,"fogrange");
Ulights = shader_get_uniform(shdr_light,"lights");
Ulcolor = shader_get_uniform(shdr_light,"lcolor");
Ulight = shader_get_uniform(shdr_light,"light");
Udlight = shader_get_uniform(shdr_light,"dlight");
Udcolor = shader_get_uniform(shdr_light,"dcolor");
Uambience = shader_get_uniform(shdr_light,"ambience");
LSamb = 0;
LSnum = 8;
LSdnum = 8;
//Point ight position and color
LSpos[31] = 0;
LScol[23] = 0;
//Sorted light position and color
LSspos[31] = 0;
LSscol[23] = 0;
//Direction light position and color
LSdpos[23] = 0;
LSdcol[23] = 0;
fogc = c_black;
fogr[1] = 0;
foge = 0;