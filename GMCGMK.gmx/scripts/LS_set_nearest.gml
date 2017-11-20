///LS_set_nearest(x,y,z)
var X,Y,Z;
X = argument0;
Y = argument1;
Z = argument2;
var order,tpos,tcol,pri;
order = ds_priority_create();
for(var i = 0;i<LSnum;i++)
{   
    tpos[i*4] = LSpos[i*4];
    tpos[i*4+1] = LSpos[i*4+1];
    tpos[i*4+2] = LSpos[i*4+2];
    tpos[i*4+3] = LSpos[i*4+3];
    
    tcol[i*3] = LScol[i*3];
    tcol[i*3+1] = LScol[i*3+1];
    tcol[i*3+2] = LScol[i*3+2];
    ds_priority_add(order,i,point_distance_3d(X,Y,Z,LSpos[i*4],LSpos[i*4+1],LSpos[i*4+2]));
}
for(var i = 0;i<LSnum;i++)
{
    pri = ds_priority_delete_min(order);
    LSspos[i*4] = tpos[pri*4];
    LSspos[i*4+1] = tpos[pri*4+1];
    LSspos[i*4+2] = tpos[pri*4+2];
    LSspos[i*4+3] = tpos[pri*4+3];
    
    LSscol[i*3] = tcol[pri*3];
    LSscol[i*3+1] = tcol[pri*3+1];
    LSscol[i*3+2] = tcol[pri*3+2];
}
ds_priority_destroy(order)