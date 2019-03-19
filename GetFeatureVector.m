function [ feature_vec ] = GetFeatureVector(state,action,rdf_centres,rdf_sigmas)

    % Returns the feature vector of a given continuous state and continous
    % action, the centres of the RDF's as well as their widths (sigma)
    
    feature_vec=[];
    num_rdf = size(rdf_centres,1);
    s = [ state(1), state(2), action ];
    
%     i=1;
    for i=1:num_rdf
        diff = s - rdf_centres(i,:); % get displacement
        exponent = dot(diff,rdf_sigmas); % scale by widths and sum
        feature_vec(i) = exp(-exponent);
    end

end