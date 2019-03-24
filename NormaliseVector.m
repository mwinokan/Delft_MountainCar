function [ vector ] = NormaliseVector(in_vec)
    
    if (size(in_vec,1) > size(in_vec,2))
        num_rbf = size(in_vec,1);
    else
        num_rbf = size(in_vec,2);
    end
    
    vec_sum = 0;
    for i=1:num_rbf
        vec_sum = vec_sum + in_vec(i)^2;
    end
    
    vec_sum = sqrt(vec_sum)
    
    vector=[];
    for i=1:num_rbf
        vector(i) = in_vec(i)/vec_sum;
        
    end

end