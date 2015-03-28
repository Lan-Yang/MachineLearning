clear all
load spam.mat
% 1. Standaridization
t_mean = mean(data);
t_std = std(data);
data = bsxfun(@minus, data, t_mean);
data = bsxfun(@rdivide, data, t_std);
testdata = bsxfun(@minus, testdata, t_mean);
testdata = bsxfun(@rdivide, testdata, t_std);
% 2. Get h and lamda range
K = 5;
lamda = [0;1;2;3;4;5;6;7;8;9;10];
lamda = exp(-lamda);
% Calculate kernel matrix
num = size(data, 1);
kernel = pdist2(data, data).^2;
h = [quantile(kernel(:), 0.1);quantile(kernel(:), 0.25);quantile(kernel(:), 0.5);quantile(kernel(:), 0.75);quantile(kernel(:), 0.9)];
% 3. Tune proper h and lamda using cross-validation error
% Random sample
rng(1);
sample = randsample([1;2;3;4;5], num, 1);
min_error = 1;
fit_h = h(1);
fit_lamda = lamda(1);
error = zeros(55,5);
count = 1;
for i = 1:5
    cur_h = h(i);
    cur_kernel = exp(-(kernel/(2*cur_h)));
    for j = 1:11
        cur_lamda = lamda(j);
        for k = 1:5
            valid_kernel = cur_kernel(sample == k, sample ~= k);
            valid_labels = labels(sample == k);
            train_kernel = cur_kernel(sample ~= k, sample ~= k);
            train_labels = labels(sample ~= k);
            alpha = train_ksvm(train_kernel,train_labels,cur_lamda);
            preds = test_ksvm(alpha,valid_kernel,train_labels);
            error(count,k) = sum(preds ~= valid_labels)/size(valid_labels,1);
        end
        if (mean(error(count,:)) < min_error)
            fit_h = cur_h;
            fit_lamda = cur_lamda;
            min_error = mean(error(count,:));
        end
        count = count + 1;
    end
end

%% 4. Test
train_kernel = exp(-(kernel/(2*fit_h)));
alpha = train_ksvm(train_kernel,labels,fit_lamda);
num2 = size(testdata, 1);
test_kernel = pdist2(testdata, data).^2;
test_kernel = exp(-(test_kernel/(2*fit_h)));
preds = test_ksvm(alpha,test_kernel,labels);
true_neg = sum(preds==-1&testlabels==-1)/num2;
false_pos = sum(preds==1&testlabels==-1)/num2;
false_neg = sum(preds==-1&testlabels==1)/num2;
true_pos = sum(preds==1&testlabels==1)/num2;
