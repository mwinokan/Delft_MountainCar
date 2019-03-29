function PrintStats(filename,episode,steps,last_max,coarseness,epsilon,epsilonDelta,alpha,gamma,scale)

    % append some statistics to a file
    fileID = fopen(filename,'a');
    fprintf(fileID,'%f %f %f %f %f %f %f %f %f %f\n',[episode,steps,last_max,coarseness(1),coarseness(2),epsilon,epsilonDelta,alpha,gamma,scale]);

end