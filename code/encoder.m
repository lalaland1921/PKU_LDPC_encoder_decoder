function [ x ] = encoder( s )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%get_H
global Hs z x;
z=56;
w=mod(s*Hs',2);
p=zeros(1,1008);
p(1,1)=w(1,1);
j=1;
for i=1:1:56
    if i>1
       p(1,i)=mod(w(1,i)+p(17*z+i-1),2);   
    end
for j=1:1:17
p(1,i+z*j)=mod(w(1,i+z*j)+p(1,i+z*(j-1)),2);
end
end
x=cat(2,p,s);
end