function [X,params] = normalizeMatrix(X)
% Normalize Matrix or Vector
% Note we need to prevent division by 0

% Calculate span of matrix
span = max(X) - min(X);
% Set span to 1 where diff is zero, to prevent NaN
span(span==0) = 1;

% Save the normalization paramters as well
params=ones(3,size(X,2));
params(1,:) = max(X);
params(2,:) = min(X);
params(3,:) = span;

% Normalize the X matrix
X = X - min(X);     % Subtract by min
X = X ./ span;      % Complete the division and return
end