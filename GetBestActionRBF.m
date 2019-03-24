function [ action_index ] = GetBestActionRBF(feature_vec,theta,actionlist)
    % Calculate the Q-value for each action
    % return the action with the best result
    
%       num_rbf = size(feature_vec,2);
%       
%       best_action = 0.0;
%       for i=1:num_rbf
%           best_action = best_action + feature_vec(i)*theta(i)*action_vec(i);
%       end
    
    num_actions = size(actionlist,1);
    
    Q = [];
    for i=1:num_actions
        Q(i) = dot(feature_vec,theta(:,i));
    end
    
    [ action_Q action_index ] = max(Q);
    
end