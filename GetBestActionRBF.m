function [ action_index ] = GetBestActionRBF(feature_vec,theta,actionlist)
    % Calculate the Q-value for each action
    % return the action with the best result
    
    % number of actions:
    num_actions = size(actionlist,1);
    
    % evaluate quality of taking each action
    Q = [];
    for i=1:num_actions
        Q(i) = dot(feature_vec,theta(:,i)); % feature vector x parameter vector
    end
    
    % maximise Q:
    [ action_Q action_index ] = max(Q);
    
end