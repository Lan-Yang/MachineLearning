clear all
load mnist.mat
n = [1000;2000;4000;8000];
error = zeros(10, 1);
errdev = zeros(4,1);
errmean = zeros(4,1);
num = size(testdata, 1);
samnum = size(data, 1);
precomp = zeros(samnum, num);
flag = 1; %if flag == 1, then we use pre-computed data, else we do not use it.
if flag == 1
    for i = 1:num
        tmp = bsxfun(@minus, data, testdata(i,:));
        precomp(:, i) = dot(tmp, tmp, 2);
    end
    disp pre-computed_end
end
for i = 1:4
    for k = 1:10
        rand = randsample(1:samnum, n(i), 1);
        X = data(rand, :);
        Y = labels(rand, :);
        if flag == 1
            Z = precomp(rand, :);
            preds = hw1_nn(X, Y, testdata, Z);
        else
            preds = hw1_nn(X, Y, testdata);
        end
        error(k) = sum(preds ~= testlabels)/size(testlabels,1);
    end
    errmean(i) = mean(error);
    errdev(i) = std(error);
    disp one_set_end
end
errorbar(n, errmean, errdev);
clear precomp

