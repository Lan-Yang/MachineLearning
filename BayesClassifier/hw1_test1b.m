function preds = hw1_test1b(params, test)
paramY = log(params.piY) - 0.5 * log(2*pi);
tmp = pdist2(test, params.muY);
result = bsxfun(@plus, paramY, (-0.5 * (tmp.^2))');
[~, index] = max(result);
preds = params.uniY(index);