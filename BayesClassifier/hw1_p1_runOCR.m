clear all
load mnist.mat
params = hw1_train1b(data, labels);
disp train_end
trainpreds = hw1_test1b(params, data);
trainerror = sum(trainpreds ~= labels)/size(data,1);
disp train_error_end
testpreds = hw1_test1b(params, testdata);
testerror = sum(testpreds ~= testlabels)/size(testdata,1);
disp test_error_end