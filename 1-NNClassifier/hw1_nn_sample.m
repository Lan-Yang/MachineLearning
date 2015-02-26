function sample = hw1_nn_sample(X, Y, n)
num = size(Y, 1);
index = 1:num;
rand = randsample(index, n, 1);
sample.X = X(rand, :);
sample.Y = Y(rand, :);