function [ y,LLR ] = real_AWGN( d,SNR)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
global sigma2;
sigma2=1/SNR
sigma=sqrt(sigma2)
[m,n]=size(d)
n=sigma*randn(m,n)
y=d+n
LLR=2/sigma2*y
end

