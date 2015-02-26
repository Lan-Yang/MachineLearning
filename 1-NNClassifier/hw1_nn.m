function preds = hw1_nn(X,Y,test,Z)
if (exist('Z', 'var'))
    [~,index] = min(Z);
    preds = Y(index);
else
    num = size(test, 1);
    preds = zeros(num, 1);
    for i=1:num
        tmp = bsxfun(@minus, X, test(i,:));
        result = dot(tmp, tmp, 2);
        [~, index] = min(result);
        preds(i) = Y(index);
    end
end