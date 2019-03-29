function [ states ] = BuildStateList(n_pos,n_vel)
%BuildStateList builds a state list from a state matrix

offset = 0;

% position list
xdiv = 2.0/(n_pos+2*offset-1);
xmin = -1.5+offset*xdiv;
xmax = 0.5-offset*xdiv;
x = xmin:xdiv:xmax;

% velocity list
vdiv = 0.14/(n_vel+2*offset-1);
vmax = 0.07-offset*vdiv;
v = -vmax:vdiv:vmax;

N=size(x,2);
M=size(v,2);

states=[];
index=1;
for i=1:N    
    for j=1:M
        states(index,1)=x(i);
        states(index,2)=v(j);
        index=index+1;
    end
end
