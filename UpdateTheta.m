function [ theta ] = UpdateTheta(feature_vec,next_feature_vec,action,next_action,theta,reward,alpha,gamma)

    Q = dot(feature_vec,theta(:,action));
    next_Q = dot(next_feature_vec,theta(:,next_action));
%     diff = next_Q - Q
%     [Q,next_Q,gamma*next_Q-Q,(reward + gamma*next_Q - Q)]
    dTheta = alpha * (reward + gamma*next_Q - Q);
    
    for i=1:size(feature_vec,2)
        theta(i,action) = theta(i,action) + dTheta*feature_vec(i);
    end

%     feature_vec;
%     dTheta;
    theta

end