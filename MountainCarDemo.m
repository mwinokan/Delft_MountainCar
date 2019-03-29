function  MountainCarDemo( maxepisodes )
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
set(gco,'Units','data')

maxsteps    = 1000;              % maximum number of steps per episode
statelist   = BuildStateList(10,6);  % builds the list of states (10 discrete positions x 6 discrete velocities)
actionlist  = BuildActionList(); % the list of actions

nstates     = size(statelist,1); % = 60
nactions    = size(actionlist,1); % = 3
Q           = BuildQTable( nstates,nactions );  % the Qtable (initially zero)

alpha       = 0.5;   % learning rate
gamma       = 1.0;   % discount factor
epsilon     = 0.01;  % probability of a random action selection
grafica     = false; % indicates if display the graphical interface

eps_start = epsilon;
last_max = 0;

xpoints=[];
ypoints=[];

for i=1:maxepisodes    
    
    [total_reward,steps,Q ] = Episode( maxsteps, Q , alpha, gamma,epsilon,statelist,actionlist,grafica );    
    
    disp(['Episode: ',int2str(i),'  Steps:',int2str(steps),'  Reward:',num2str(total_reward),' epsilon: ',num2str(epsilon)])
    
    epsilon = epsilon * 0.99; % decrease randomness as learning iterations increase
    
    % plot number of steps vs episode number:
    xpoints(i)=i-1;
    ypoints(i)=steps;
    subplot(2,1,1);    
    plot(xpoints,ypoints)      
    title(['Episode: ',int2str(i),' epsilon: ',num2str(epsilon)])    
    drawnow
    
    if (steps==maxsteps)
        last_max=i;
    end
    
    if (i==200)
        PrintStats('stats_disc_max.dat',maxepisodes,steps,last_max,[n_pos,n_vel],eps_start,0.99,alpha,gamma,0.0);
    end
    
    if (i>200)
        grafica=true;
    end
end






