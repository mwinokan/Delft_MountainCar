function [ action_index ] = EpsGreedyRBF(feature_vec,theta,actionlist,epsilon)

    if (rand()>epsilon)
        action_index = GetBestActionRBF(feature_vec,theta,actionlist);
    else
        action_index = randi(size(actionlist,1));
    end

end