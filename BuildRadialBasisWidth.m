function [ widths ] = BuildRadialBasisWidth( scale, coarseness, offset)
    % Return the Radial Basis Function Widths
    
    n_pos = coarseness(1);
    n_vel = coarseness(2);

    p = scale*2.0/(n_pos+2*offset-1);
    v = scale*0.14/(n_vel+2*offset-1);
    widths = [p,v];
    
end