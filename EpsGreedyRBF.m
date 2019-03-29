function [ action_index ] = EpsGreedyRBF(feature_vec,theta,actionlist,epsilon)

    % Epsilon greedy selection scheme for the RBF implementation

    if (rand()>epsilon)
        % Most of the time find best action from maximal Q-value:
        action_index = GetBestActionRBF(feature_vec,theta,actionlist);
    else
        % Occassionally take a random action:
        action_index = randi(size(actionlist,1));
    end

end