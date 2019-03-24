function [ feature_vec ] = GetFeatureVector(state,rdf_centres,rdf_sigmas)

    % Returns the feature vector of a given continuous state and continous
    % action, the centres of the RDF's as well as their widths (sigma)
    
    feature_vec=[];
    num_rdf = size(rdf_centres,1);
    
%     i=1;
    for i=1:num_rdf
%         diff = state - rdf_centres(i,:); % get displacement
        diff_x = (state(1)-rdf_centres(i,1))^2;
        diff_v = (state(2)-rdf_centres(i,2))^2;
        
        exp_x = diff_x/(2*rdf_sigmas(1)^2);
        exp_v = diff_v/(2*rdf_sigmas(2)^2);
        
%         exponent = dot(diff,2*rdf_sigmas.^2); % scale by widths and sum
        feature_vec(i) = exp(-exp_x)*exp(-exp_v);
    end
    
    feature_vec = NormaliseVector(feature_vec);

end