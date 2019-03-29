function MountainCarDemoRBF(maxepisodes, animate)
    %MountainCarDemo, the main function of the demo
    %maxepisodes: maximum number of episodes to run the demo
    
    %%%%% parameter setting %%%%%
    
    maxsteps    = 1500;              % maximum number of steps per episode

    % radial basis:
    coarseness = [ 2,3 ];   % [num_position,num_velocity], low feature solution
    coarseness = [ 4,5 ];   % better solution
    scale = 0.5;            % scale of RBFs
    offset = 0.0;           % RBF offset
    
    epsilon = 0.005;        % rate of random action
    epsilon_var = 0.999;    % rate of change of epsilon

    alpha = 0.006;          % learning rate
    gamma = 0.99;           % discount factor
    
    eps_start = epsilon;    % store starting epislon value
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % default to showing animation if number of arguments < 2
    if nargin < 2
      animate=true;
    end

    clc
    clf
    set(gcf,'BackingStore','off')  % for realtime inverse kinematics
    set(gcf,'name','Reinforcement Learning Mountain Car')  % for realtime inverse kinematics
    set(gco,'Units','points')
  
    % Build state-list:
    % Build list of RBF coordinates in state-action space (index,pos,vel)
    rdf_centres = BuildRadialBasisCentres(coarseness,offset);       % list of RBF centre coordinates
    rdf_sigmas = BuildRadialBasisWidth(scale,coarseness,offset);    % standard deviation of RBF's
    num_rdf = size(rdf_centres,1);                                  % number of RBF's

    % Build action-list:
    actionlist = BuildActionList();         % actions = [-1,0,1]
    num_actions = size(actionlist,1);       % number of actions
    
    theta = zeros(num_rdf,num_actions);     % initialise parameter vector array
    
    last_max = 0;                           % metric for rate of convergence
    grafica     = false;                % indicates if display the animation interface

    for i=1:maxepisodes

        % Run episode:
        [total_reward,steps,theta] = EpisodeRBF(maxsteps,theta,alpha,gamma,epsilon,actionlist,rdf_centres,rdf_sigmas,grafica);

        % Write to console:
        disp(['Episode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])

        % Update epsilon
        epsilon = epsilon * epsilon_var; % decrease randomness as learning iterations increase
        
        % plot number of steps vs episode number:
        xpoints(i)=i-1;
        ypoints(i)=steps;
        subplot(2,1,1);    
        plot(xpoints,ypoints)      
        title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
        drawnow
        
        % metric for rate of convergence
        if (steps==maxsteps)
            last_max=i;
        end

        % if last episode show the animation
        if (i==maxepisodes-1 && animate)
            grafica=true;
        end
        
        % Write out resulting policy and statistics
        if (i==maxepisodes)
            printArr=[xpoints; ypoints];
            fileID = fopen('steps_max.dat','w');
            fprintf(fileID,'%f %f\n',printArr);
            PrintTheta(theta,'theta_max.dat');
            PrintStats('stats_max.dat',maxepisodes,steps,last_max,coarseness,eps_start,epsilon_var,alpha,gamma,scale);
        end

    end
    
end




