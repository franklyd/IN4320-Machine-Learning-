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
randn('seed',0);
A = randn(100,2);
randn('seed',1);
B = randn(100,2);
B(:,1) = B(:,1)+2;
X = [A;B];
lab = [ones(100,1);ones(100,1)+1];
scatterd(prdataset(X,lab),'legend');
[feat,theta,y] = weakLearner(X,lab);
