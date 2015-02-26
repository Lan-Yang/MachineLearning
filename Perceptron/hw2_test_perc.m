function preds = hw2_test_perc(params, test)
result = test * (params.w)' - params.theta;
len = size(test, 1);
preds = zeros(len, 1);
preds(result >= 0) = 1;
preds(result < 0) = -1;