///draw_thing(sprite,scale)
d3d_transform_set_identity();
d3d_transform_add_rotation_x(90);
d3d_transform_add_rotation_z(point_direction(x, y, oCamera.camx, oCamera.camy)+90);
//d3d_transform_add_translation(x, y, 0)
draw_set_alpha_test(1)
draw_sprite_ext(argument0, 0, x, y, argument1, argument1, 0, c_white, 1);
d3d_transform_set_identity();