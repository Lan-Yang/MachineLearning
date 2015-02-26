function preds = hw2_test_bnb(params, test)
classNum = length(params.uniY);
dataSize = size(test);
result = zeros(dataSize(1), classNum);
piY = log(params.piY);
invpK = log(1 - params.pK);
minuspK = log(params.pK) - invpK;
for k = 1: classNum
%     keyboard
    tmp1 = test * (minuspK(k,:))';
    result(:,k) = tmp1 + sum(invpK(k,:)) + piY(k);
    clear tmp1
end
[~,index] = max(result,[],2);
preds = params.uniY(index);
disp test_end