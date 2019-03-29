function [ theta ] = UpdateTheta(feature_vec,next_feature_vec,action,next_action,theta,reward,alpha,gamma)

    % Update the parameter vector via SARSA

    % Get current and next Q-values:
    Q = dot(feature_vec,theta(:,action));
    next_Q = dot(next_feature_vec,theta(:,next_action));

    % Get parameter vector change
    dTheta = alpha * (reward + gamma*next_Q - Q);
    
    % Iterate parameter vector:
    for i=1:size(feature_vec,2)
        theta(i,action) = theta(i,action) + dTheta*feature_vec(i);
    end

end