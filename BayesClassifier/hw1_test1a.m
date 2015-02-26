function preds = hw1_test1a(params, test)
dataSize = size(test);
classNum = size(params.piY,1);
result = zeros(classNum, dataSize(1));
for i = 1:classNum
    paramY = params.piY(i)/sqrt(det(params.sigmaY(:,:,i)));
    minuY = bsxfun(@minus, test, params.muY(i,:));
    tmp = (minuY / params.sigmaY(:,:,i)) * minuY';
    result(i, :) = paramY*exp(-0.5 * diag(tmp))';
end
[~, index] = max(result);
preds = params.uniY(index);