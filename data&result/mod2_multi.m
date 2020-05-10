function [ z ] = mod2_multi( x,y )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
[x1,x2]=size(x);[y1,y2]=size(y);
z=x*y;
[m,n]=size(z);
for i=1:1:m
    for j=1:1:n
        z(i,j)=mod(z(i,j),2);
    end

end

