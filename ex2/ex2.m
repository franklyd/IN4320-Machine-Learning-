%% a. prove exp(-x) >= (1-x)
%plot it
x = linspace(-5,5,100);
y1 = exp(-x);
y2 = 1-x;
plot(x,y1)
hold on
plot(x,y2);
legend('e^-^x','1-x');
title('e^-^x VS 1-x ')
hold off

%% b&c. weak learner and test the implementation
%randn('seed',0);
A = randn(100,2);
%randn('seed',1);
B = randn(100,2);
B(:,1) = B(:,1)+2;
X = [A;B];
lab = [ones(100,1);ones(100,1)+1];
scatterd(prdataset(X,lab),'legend');
[feat,theta,y] = weakLearner(X,lab);
%%
B(:,1) = B(:,1)*2;
A(:,1) = A(:,1)*2;
X = [A;B];
[feat1,theta1,y1] = weakLearner(X,lab);
figure;
scatterd(prdataset(X,lab),'legend');

%% d testing on digit datset
clear all;
X = load('optdigitsubset.txt');
lab = [ones(554,1);ones(571,1)+1];
X = prdataset(X,lab);
[X_train,X_test] = gendat(X,[50,50]);

[feat,theta,y] = weakLearner(X_train);
e = calculateError( feat,theta,y,X_test);

%% e weighted version
% Question: should the weight be normalized??
% a simple case for testing
X = gendats([100,100],2);
scatterd(X,'legend');
weight = [ones(100,1);ones(100,1)];
[feat,theta,y]  = weightedWeakLearner( X,weight);
e = calculateError( feat,theta,y,X,weight);

%% e weighted testing on digit dataset
lab = getlab(X_train);
weight = ones(size(lab));
[feat,theta,y]  = weightedWeakLearner( X_train,weight);