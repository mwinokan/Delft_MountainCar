function [total_reward,steps,theta] = EpisodeRBF(maxsteps,theta,alpha,gamma,epsilon,actionlist,rdf_centres,rdf_sigmas,grafic)

    % initial state
    ini_x = -0.5;
    ini_v = 0.0;
    state = [ ini_x,ini_v ];
    
    % get the feature vector for the current state in the RBF basis
    feature_vec = GetFeatureVector(state,rdf_centres,rdf_sigmas);
   
    steps = 0;
    total_reward = 0;
    
    % selects an action using the epsilon greedy selection strategy:
    action_index = EpsGreedyRBF(feature_vec,theta,actionlist,epsilon);
    
    for i=1:maxsteps
        
        % convert the index of the action into an action value
        action = actionlist(action_index);
        
        % Do the selected action and get the next state
        next_state = DoAction(action,state);

        % Reward for reaching the next state
        [r,f] = GetReward(next_state);
        total_reward = total_reward + r; % increment total reward

        % Get feature vector for next state
        next_feature_vec = GetFeatureVector(next_state,rdf_centres,rdf_sigmas);
        
        % Determine next action
        next_action_index = EpsGreedyRBF(next_feature_vec,theta,actionlist,epsilon);

        % Update the parameter vector for this action - learn from experience
        theta = UpdateTheta(feature_vec,next_feature_vec,action_index,next_action_index,theta,r,alpha,gamma);
        
        % overwrite variables
        state = next_state;
        action_index = next_action_index;
        feature_vec = next_feature_vec;
        
        steps = steps+1;
        
        % animate:
        if (grafic==true)        
            MountainCarPlot(state,action,steps);
        end
        
        % if done end loop:
        if (f==true)
            break
        end
       
    end
    
end