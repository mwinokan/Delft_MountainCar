function MountainCarDemoRBF( maxepisodes )
    %MountainCarDemo, the main function of the demo
    %maxepisodes: maximum number of episodes to run the demo

    % Mountain Car Problem with SARSA 
    % Programmed in Matlab 
    % by:
    %  Jose Antonio Martin H. <jamartinh@fdi.ucm.es>
    % 
    % See Sutton & Barto book: Reinforcement Learning p.214

    clc
    clf
    set(gcf,'BackingStore','off')  % for realtime inverse kinematics
    set(gcf,'name','Reinforcement Learning Mountain Car')  % for realtime inverse kinematics
    set(gco,'Units','points')

    maxsteps    = 1500;              % maximum number of steps per episode

    grafica     = false; % indicates if display the graphical interface
    
    
%     epsilon_var=1.0;

    % parameter sets (worst to best):
    coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.9; epsilon_var=0.999; % does not converge in 200 eps
    coarseness = [ 4,5 ]; epsilon = 0.01; alpha = 0.5; gamma = 1.0; epsilon_var=0.99; % given values, initially good solutions, diverges quickly
    coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.99; epsilon_var=0.99; % 420 steps at 200 episodes, rough conversion after 50 eps
    coarseness = [ 4,4 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.99; epsilon_var=1.0; % 240 steps at 200 episodes, rough conversion after 80 eps
    coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.995; epsilon_var=0.999; % 230 steps at 200 episodes, rough conversion after 170 eps
    coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.99; epsilon_var=1.0; % 220 steps at 200 episodes, rough conversion after 160 eps
    coarseness = [ 5,5 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.99; epsilon_var=1.0; % 220 steps at 200 episodes, rough conversion after 170 eps
    coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.99; epsilon_var=0.999; % 210 steps at 200 episodes, rough conversion after 50 eps
    coarseness = [ 6,6 ]; epsilon = 0.1; alpha = 0.008; gamma = 0.99; epsilon_var=0.999; % 200 steps at 200 episodes, rough conversion after 190 eps
    
%     coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.016; gamma = 0.99; epsilon_var=0.999; % very big spikes
    coarseness = [ 4,5 ]; epsilon = 0.1; alpha = 0.004; gamma = 0.99; epsilon_var=0.999; % 290 steps at 200 episodes, rough conversion after 90 eps
    coarseness = [ 4,5 ]; epsilon = 0.05; alpha = 0.004; gamma = 0.99; epsilon_var=0.999; % 130,250 steps at 200 episodes, rough conversion after 40 eps

      
    offset = 0.0;
    % list of RDF coordinates in state-action space (index,pos,vel,act)
    rdf_centres = BuildRadialBasisCentres(coarseness,offset);
    rdf_sigmas = BuildRadialBasisWidth(1.0,coarseness,offset); % width of RDF's
    num_rdf = size(rdf_centres,1); % number of RDF's

    actionlist = BuildActionList();
    num_actions = size(actionlist,1);
    theta = zeros(num_rdf,num_actions);
    
    theta

    for i=1:maxepisodes
%         
        [total_reward,steps,theta] = EpisodeRBF(maxsteps,theta,alpha,gamma,epsilon,actionlist,rdf_centres,rdf_sigmas,grafica);
% 
        disp(['Episode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])

        epsilon = epsilon * epsilon_var; % decrease randomness as learning iterations increase
        
        % plot number of steps vs episode number:
        xpoints(i)=i-1;
        ypoints(i)=steps;
        subplot(3,1,1);    
        plot(xpoints,ypoints)      
        title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
        drawnow
        subplot(3,1,2);    
        y2points(i)=sum(sum(theta));
        plot(xpoints,y2points)
        title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])
        drawnow
        
%         if (i==20) 
%             epsilon = 0.01;
%         end

        if (i==maxepisodes-1)
            grafica=true;
            theta
        end
        
    end

end

% nstates     = size(statelist,1); % = 60
% nactions    = size(actionlist,1); % = 3
% Q           = BuildQTable( nstates,nactions );  % the Qtable (initially zero)
% 
% alpha       = 0.5;   % learning rate
% gamma       = 1.0;   % discount factor
% epsilon     = 0.01;  % probability of a random action selection
% grafica     = false; % indicates if display the graphical interface
% 
% xpoints=[];
% ypoints=[];
% 
% for i=1:maxepisodes    
%     
%     [total_reward,steps,Q ] = Episode( maxsteps, Q , alpha, gamma,epsilon,statelist,actionlist,grafica );    
%     
%     disp(['Episode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])
%     
%     epsilon = epsilon * 0.99; % decrease randomness as learning iterations increase
%     
%     % plot number of steps vs episode number:
%     xpoints(i)=i-1;
%     ypoints(i)=steps;
%     subplot(2,1,1);    
%     plot(xpoints,ypoints)      
%     title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
%     drawnow
%     
%     if (i>200)
%         grafica=true;
%     end
% end






