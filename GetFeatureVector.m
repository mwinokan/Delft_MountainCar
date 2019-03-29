function [ feature_vec ] = GetFeatureVector(state,rdf_centres,rdf_sigmas)

    % Returns the feature vector of a given continuous state and continous
    % action, the centres of the RDF's as well as their widths (sigma)
    
    feature_vec=[];
    num_rdf = size(rdf_centres,1); % number of features in basis
    
    for i=1:num_rdf
        
        % get displacement along coordinates:
        diff_x = (state(1)-rdf_centres(i,1))^2;
        diff_v = (state(2)-rdf_centres(i,2))^2;
        
        % get the exponent by scaling the differences:
        exp_x = diff_x/(2*rdf_sigmas(1)^2);
        exp_v = diff_v/(2*rdf_sigmas(2)^2);
        
        % evaluate the element of the feature vector
        feature_vec(i) = exp(-exp_x)*exp(-exp_v);
    end
    
    % return normalised vector:
    feature_vec = NormaliseVector(feature_vec);

end