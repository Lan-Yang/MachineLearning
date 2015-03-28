function preds = test_ksvm(alpha,kernel,labels)
% preds = test_ksvm(alpha,kernel,labels)
%
% Inputs:
% 'alpha'          n x 1   dual variables
% 'kernel'         m x n   kernel matrix (between test and training points)
% 'labels'         n x 1   training example labels
%
% Outputs:
% 'preds'          m x 1   predicted labels
%
% This function computes the prediction on test points using the function
% implicitly represented by the dual variables and the training examples.
% The test points and training points are only accessed via the (partial)
% kernel matrix: the (i,j)-th entry is the kernel evaluation between the
% i-th test point and the j-th training point.

preds = sign(kernel * (alpha .* labels));
