function  MountainCarDemoRBF( maxepisodes )
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

coarseness = [ 10,6,3 ];
coarseness = [ 5,3,2 ];
offset = 0.0;
% list of RDF coordinates in state-action space (index,pos,vel,act)
rdf_centres = BuildRadialBasisCentres(coarseness,offset); 
rdf_sigmas = BuildRadialBasisWidth(coarseness,offset) % width of RDF's
num_rdf = size(rdf_centres,1); % number of RDF's

state=[ -1.0,0.03 ];
action=0.8;

feature_vec = GetFeatureVector(state,action,rdf_centres,rdf_sigmas)

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






