function params = hw2_train_perc(X, Y, num_passes)
datasize = size(X);
params.w = zeros(1, datasize(2));
params.theta = 0;
for i = 1:num_passes
    for j = 1:datasize(1)
        if ((X(j,:)*(params.w') - params.theta)*Y(j) <= 0)
            params.w = params.w + Y(j)*X(j,:);
            params.theta = params.theta - Y(j);
        end
    end
end