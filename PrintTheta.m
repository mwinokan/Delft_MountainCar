function PrintTheta(theta,filename)
    
    % Write out the parameter vector to a file

    fileID = fopen(filename,'w');
    
    for i=1:size(theta(:,1),1)
        fprintf(fileID,'%f %f %f\n',[theta(i,1),theta(i,2),theta(i,3)]);
    end
end