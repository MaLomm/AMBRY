function [ps]=RESPONSERULE(responseactivation,phi)
%--------------------------------------------------------------------------
% This script simply calculates classification probabilities for a set of
% alcove's output activations, with a given parameter phi.
%	 
% -------------------------------------
% --INPUT ARGUMENTS		 	DESCRIPTION
% 	outputactivation		observed output activation from FORWARDPASS
% 	phi						response mapping parameter
%--------------------------------------------------------------------------

numcategories 		= size(responseactivation,2);
outputactivation 	= exp(responseactivation .* phi);
ps = bsxfun(@rdivide,responseactivation,sum(responseactivation,2));

