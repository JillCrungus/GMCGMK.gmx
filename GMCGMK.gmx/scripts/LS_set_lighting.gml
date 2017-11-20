///LS_set_lighting(enable)
if argument0
{    
    //Apply
    shader_set(shdr_light)
    shader_set_uniform_f_array(Ulight,LSspos)
    shader_set_uniform_f_array(Ulcolor,LSscol)
    shader_set_uniform_f_array(Udlight,LSdpos)
    shader_set_uniform_f_array(Udcolor,LSdcol)
    shader_set_uniform_f(Uambience,colour_get_red(LSamb)/255,colour_get_green(LSamb)/255,colour_get_blue(LSamb)/255)
    shader_set_uniform_f(Ufogc,colour_get_red(fogc)/255,colour_get_green(fogc)/255,colour_get_blue(fogc)/255)
    shader_set_uniform_f(Ufogr,fogr[0],fogr[1],foge)
    //texture_set_stage(shader_get_sampler_index(shdr_light_normal,"normal"),background_get_texture(bac_normal))
}
else
{
    shader_reset()
}