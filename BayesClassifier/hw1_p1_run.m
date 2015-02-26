clear all
load hw1_data.mat
params = hw1_train1a(data, labels);
trainpreds = hw1_test1a(params, data);
trainerror = sum(trainpreds ~= labels)/size(data,1);
testpreds = hw1_test1a(params, testdata);
testerror = sum(testpreds ~= testlabels)/size(testdata,1);