///place_meeting_ext(x, y, z, obj)
// This collision script only works if the sprite of the object
// calling it is centred.
 
xx  = argument0;
yy  = argument1;
zz  = argument2;
obj = argument3;
 
with (obj) {
    var hw = other.sprite_width * 0.5;
    var hl = other.sprite_height * 0.5;
    var h  = other.height;
    if (other.xx > x - hw + 1 &&
        other.xx < x + sprite_width  + hw - 1 &&
        other.yy > y - hl + 1 &&
        other.yy < y + sprite_height + hl - 1 &&
        other.zz > z - h  + 1 &&
        other.zz < z + height - 1) {
            return true;
            }
    }
return false;