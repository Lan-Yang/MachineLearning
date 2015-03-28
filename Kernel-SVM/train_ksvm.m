function alpha = train_ksvm(kernel,labels,lambda)
% alpha = train_ksvm(kernel,labels,lambda)
%
% Inputs:
% 'kernel'         n x n   kernel matrix
% 'labels'         n x 1   label vector
% 'lambda'         scalar  regularization parameter
%
% Outputs:
% 'alpha'          n x 1   dual variables
%
% This function solves (the dual of) the SVM optimization problem
%   min_w 0.5 ||w||_2^2 + (1/n) sum_{(x,y) in S} hinge_loss(w;(phi(x),y))
% where S is the training data and phi is the feature map corresponding to
% the kernel K used to form the input kernel matrix.
%
% The final SVM classifier is
%   f(z) = sign( sum_{(x,y) in S} alpha_i y K(x,z) )

n = length(labels);
H = diag(labels)*kernel*diag(labels);
C = 1/(n*lambda);
alpha = quadprog(H, -ones(n,1), [], [], [], [], zeros(n,1), C*ones(n,1));
