function params = hw2_train_bnb(X, Y)
params.uniY = unique(Y);
classNum = length(params.uniY);
labelNum = length(Y);
dataSize = size(X);
params.piY = zeros(classNum, 1);
params.pK = zeros(classNum, dataSize(2));
for k = 1:classNum
    tmp1 = sum(Y==params.uniY(k));
    params.piY(k) = tmp1/labelNum;
    tmp2 = sum(X(Y == params.uniY(k),:));
    params.pK(k, :) = (tmp2 + 1)/(2 + tmp1);
end
disp training_end