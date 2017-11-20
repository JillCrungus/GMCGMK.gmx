///draw_decal(sprite,scale,rotation,height)
if ( point_distance(x,y,oPlayer.x, oPlayer.y) <= oPlayer.lightRange )
{
    d3d_set_lighting(false);
}
else
{
   d3d_set_lighting(true);
}

//xs = argument1 - (point_distance(x,y, oPlayer.x, oPlayer.y) / 250) * (oPlayer.pitch / 4000);
//ys = argument1  - (point_distance(x,y, oPlayer.x, oPlayer.y) / 250) * (oPlayer.direction / 4000);
xs = argument1 - point_distance(x,y, oPlayer.x, oPlayer.y) / 3000
ys = xs
d3d_transform_set_identity();
d3d_transform_add_rotation_x(90);
d3d_transform_add_rotation_z(argument2);
d3d_transform_add_translation(x, y, argument3)
draw_set_alpha_test(1)
aaa = 0.25
aaaaa = 0.25
draw_sprite_ext(argument0, 0, 0, 3.5, xs, ys, 0, c_white, 1);
d3d_transform_set_identity();
d3d_set_lighting(true);

//show_debug_message(point_distance(x,y, oPlayer.x, oPlayer.y) / 500)