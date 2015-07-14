function [Ktest, Ktest2] = ml_centralizeTestKernel2(sKtrain, Ktest, Ktest2)
% Centralize the test kernels, the center is taken to be the center of 
% the train data.
% Usages:
%   [Ktest] = m_centralizeTestKernel2(sKtrain, Ktest)
%   [Ktest, Ktest2] = m_centralizeTestKernel2(sKtrain, Ktest, Ktest2)
% Inputs:
%   sKtrain: a square m*1 vector for matrix representing the info about
%       training kernel.
%       sKtrain(i) = mean_j(k(x_i, x_j)), x_i is the i_th training instance.
%   Ktest: the m*n kernel matrix, Ktest(i,j) = k(x_i,y_j) where k is kernel
%       function, x_i is the i_th training instance and y_j is the j_th 
%       testing instance. There are m and n training and testing instances
%       respectively.
%   Ktest2: the n*n kernel matrix, Ktest2(i,j) = k(y_i,y_j) where k is the
%       kernel function.
% Outputs:
%   Ktest, Ktest2: kernels after centralization.
% By Minh Hoai Nguyen (minhhoai@gmail.com)
% Date: 24 Oct 08

m = length(sKtrain);
a = sKtrain';

n = size(Ktest,2);
b = mean(Ktest,1);
Ktest = Ktest - repmat(b,m,1) - repmat(a',1,n) + mean(a);

if nargin == 3
    Ktest2 = Ktest2 - repmat(b, n, 1) - repmat(b', 1, n) + mean(a);
end
