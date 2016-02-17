function [responseactivation, categoryactivation, hiddenactivation] = FORWARDPASS(...
	stimuli,exemplars,distancemetric,attentionweights,associationweights,responseweights,params)
%--------------------------------------------------------------------------
% This script runs a forward pass in alcove and returns the information
% about network performance.
% 
% -------------------------------------
% --INPUT ARGUMENTS			DESCRIPTION
%	networkinput			items to be passed through the model
%	exemplars				coordinates of each known exemplar
%	attentionweights		input->hidden weights
% 	associationweights		hidden->category weights
%   responseweights         category->response weights
%	distancemetric			0 for city block, 1 for euclidean
% 	params					parameters [c,assoclearning,attenlearning,responlearning,phi]

% -------------------------------------
% --OUTPUT ARGUMENTS		DESCRIPTION
%	responseactivation		output unit activations
%	categoryactivation		category unit activations
%	hiddenactivation		exemplar node activations
%--------------------------------------------------------------------------

% initialize variables
c = params(1);
beta = params(4);
	
%Calculate Distances and Activation at Hidden Node
%-----------------------------------------------------
distances = pairdist(stimuli,exemplars,distancemetric,attentionweights, beta);
hiddenactivation = exp((-c)*distances);

% Calculates the activation at the category nodes
%-----------------------------------------------------
categoryactivation = hiddenactivation * associationweights;

% Calculates the activation at the category nodes
%-----------------------------------------------------
responseactivation = categoryactivation * responseweights;

% humble teachers
responseactivation(responseactivation> 1) =  1.0;
responseactivation(responseactivation<-1) = -1.0;

end
