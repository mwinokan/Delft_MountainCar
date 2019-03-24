function [ RDF_C ] = BuildRadialBasisCentres( coarseness, offset )
    % Return a list of positions in 3D space describing the centres
    % of the Radial Basis Functions (RBF).
   
    n_pos = coarseness(1);
    n_vel = coarseness(2);
    
    % offset in case you don't want a RDF on the boundary
    
    % position list
    xdiv = 2.0/(n_pos+2*offset-1);
    xmin = -1.5+offset*xdiv;
    xmax = 0.5-offset*xdiv;
    x = xmin:xdiv:xmax;
    
    % velocity list
    vdiv = 0.14/(n_vel+2*offset-1);
    vmax = 0.07-offset*vdiv;
    v = -vmax:vdiv:vmax;
    
    RDF_C=[];
    index = 1;
    for i=1:n_pos
        for j=1:n_vel
            RDF_C(index,1)=x(i);
            RDF_C(index,2)=v(j);
            index=index+1;
        end
    end
    
end