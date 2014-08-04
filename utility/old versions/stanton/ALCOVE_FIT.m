function [fitValue] = ALCOVE_FIT(params,fitMeasure,data,numInputs,...
    numHidNodes,numOutputs,distanceMetric,numEpochs,numStim,stimCoords)
 
SSD = 0; %Sum of Squared Deviations as measure of fit
RMSD = 1; %Root means square deviation as measure of fit

global fitValue

fitValue=0;

if params(1)<0 | params(2)<0 | params(3)<0 | params(4)<0 
     fitValue=10000;

else

    % Fit ALCOVE to Type I data
    type = 1;
        teacherValues = [1 -1;...
               1 -1;...
               1 -1;...
               1 -1;...
               -1 1;...
               -1 1;...
               -1 1;...
               -1 1];

    ALCOVE_TRAIN(params, fitMeasure, data(1,:), numInputs, numHidNodes, ...
        numOutputs, distanceMetric, numEpochs, numStim, stimCoords, ...
        teacherValues);

    
        % Fit ALCOVE to Type I data
    type = 2;
        teacherValues = [1 -1;...
               1 -1;...
               -1 1;...
               -1 1;...
               -1 1;...
               -1 1;...
               1 -1;...
               1 -1];

    ALCOVE_TRAIN(params, fitMeasure, data(2,:), numInputs, numHidNodes, ...
        numOutputs, distanceMetric, numEpochs, numStim, stimCoords, ...
        teacherValues);
    
        % Fit ALCOVE to Type I data
    type = 4;
        teacherValues = [1 -1;...
               1 -1;...
               1 -1;...
               -1 1;...
               1 -1;...
               -1 1;...
               -1 1;...
               -1 1];

    ALCOVE_TRAIN(params, fitMeasure, data(3,:), numInputs, numHidNodes, ...
        numOutputs, distanceMetric, numEpochs, numStim, stimCoords, ...
        teacherValues);
end

fitValue;