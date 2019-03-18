function [ states ] = BuildStateList
%BuildStateList builds a state list from a state matrix

% state discretization for the mountain car problem
xdiv  = (0.55-(-1.5))   / 10.0; % 0.205
xpdiv = (0.07-(-0.07)) / 5.0;   % 0.0028

x = -1.5:xdiv:0.5; % x = (-1.5:0.205:0.345) [10]
xp= -0.07:xpdiv:0.07; % v = (-0.07:0.0028:0.07) [6]

N=size(x,2);
M=size(xp,2);

states=[];
index=1;
for i=1:N    
    for j=1:M
        states(index,1)=x(i);
        states(index,2)=xp(j);
        index=index+1;
    end
end
