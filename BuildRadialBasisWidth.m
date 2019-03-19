function [ widths ] = BuildRadialBasisWidth( coarseness, offset)
    % Return the Radial Basis Function Widths
    
    n_pos = coarseness(1);
    n_vel = coarseness(2);
    n_act = coarseness(3);
   
    p = 2.0/(n_pos+2*offset-1);
    v = 0.14/(n_vel+2*offset-1);
    a = 2.0/(n_act+2*offset-1);
    widths = [p,v,a];
    
end