function params = hw2_train_avgperc(X, Y, num_passes)
datasize = size(X);
params.w = zeros(1, datasize(2));
tmpw = zeros(1, datasize(2));
params.theta = 0;
tmptheta = 0;
c = 0;
for i = 1:num_passes
    for j = 1:datasize(1)
        if ((X(j,:)*(tmpw)' - tmptheta)*Y(j) <= 0)
            params.w = params.w + c * tmpw;
            params.theta = params.theta + c * tmptheta;
            tmpw = tmpw + Y(j)*X(j,:);
            tmptheta = tmptheta - Y(j);
            c = 0;
        else
            c = c + 1;
        end
    end
    params.w = params.w + c * tmpw;
    params.theta = params.theta + c * tmptheta;
end
