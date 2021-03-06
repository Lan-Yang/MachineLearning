function params = hw1_train1b(X, Y)
params.uniY = unique(Y);
classNum = length(params.uniY);
labelNum = length(Y);
dataSize = size(X);
params.piY = zeros(classNum, 1);
params.muY = zeros(classNum, dataSize(2));
params.sigmaY = zeros(dataSize(2), dataSize(2), classNum);
for j = 1:classNum
    params.piY(j) = (1/labelNum) * sum(Y==params.uniY(j));
    params.muY(j, :) = mean(X(Y == params.uniY(j), :));
    params.sigmaY(:,:,j) = eye(dataSize(2));
end