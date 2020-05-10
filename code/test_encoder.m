function [ t ] = test_encoder( x )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
global H;

y=mod(H*x',2);
t=sum(y);

end

