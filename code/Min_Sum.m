function [ s_,flag ] = Min_Sum( LLR,iternum )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


% flag=false
% global H K N index ind_l;
% U=zeros(1,ind_l);
% V=zeros(1,ind_l);
% flag=false;
% for i=1:1:ind_l
%     tmp=index(i,:);
%     m=tmp(1,1);
%     n=tmp(1,2);
%     U(1,i)=LLR(1,n)
% end
% u_sum=LLR
% for j=1:1:ind_l
%     tmp=index(i,:);
%     m=tmp(1,1);
%     n=tmp(1,2);
%     u_sum(1,n)=u_sum(1,n)+U(1,j)
% end
% for i=1:1:iternum
%     
%     for j=1:1:ind_l
%         tmp=index(j,:);
%         m=tmp(1,1);
%         n=tmp(1,2);
%         V(1,j)=u_sum(1,n)-U(1,j)
%     end
%     signs=ones(1,N-K);
%     for j=1:1:ind_l
%         tmp=index(i,:);
%         m=tmp(1,1);
%     u_sum=LLR
%     for j=1:1:ind_l
%         tmp=index(i,:);
%         m=tmp(1,1);
%         n=tmp(1,2);
%         u_sum(1,n)=u_sum(1,n)+U(1,j)
%     end
%     X_=u_sum<0
%     if H*X_'==0
%         flag=true
%         break
%     end
% end
% op=1-eye(N-K,N-K);
% U0=zeros(N-K,N);
% U=zeros(N-K,N);
% for i=1:1:N-K
%     U0(i,:)=H(i,:).*LLR;
%     U(i,:)=H(i,:).*LLR;
% end
% for i=1:1:30
%     V=(U0+op*U).*double(H)
%     tan_V=tanh(V/2)+(1-H)
%     tmp=ones(N-K,1)
%     for i=1:1:N
%         tmp=tmp.*tan_V(:,i)
%     end
%     for i=1:1:N
%         U(:,i)=2*atanh(tmp./tan_V(:,i))
%     end
%     U=U.*H
%     X_=(sum(U)+LLR)<0
%     if H*X_'==0
%         flag=true
%         break
%     end
% end
global H_sp H K N;
flag=false;
U=zeros(N-K,N);

rep_LLR=repmat(LLR,N-K,1);
U(H)=rep_LLR(H);

V=zeros(N-K,N);
u_sum=sum(U)+LLR;
for i=1:iternum    
    for j=1:N
        v=V(:,j);
        u=U(:,j);
        v(H(:,j))=u_sum(1,j)-u(H(:,j));
        V(:,j)=v;
        
    end
    for j=1:N-K
        v=V(j,:);
        u=U(j,:);
        v=v(H(j,:));
        signs=sign(v);
        total_sign=prod(signs);
        [m,n]=size(v);
        abs_v=abs(v);
        if abs_v(1)<abs_v(2)
            min_abs=abs_v(1);
            less_abs=abs_v(2);
        else
            min_abs=abs_v(2);
            less_abs=abs_v(1);
        end
        for jj=3:n
            if abs_v(jj)<min_abs
                less_abs=min_abs;
                min_abs=abs_v(jj);
            elseif abs_v(jj)<less_abs
                less_abs=abs_v(jj);
            end
        end
        min_value=zeros(m,n);
        for jj=1:n
            if abs_v(jj)>min_abs
                min_value(jj)=min_abs;
            else
                min_value(jj)=less_abs;
            end
        end
        u(H(j,:))=(total_sign./signs).*min_value;
        U(j,:)=u;
    end
                
        
    u_sum=sum(U)+LLR;
    X_=u_sum<0; 
%     Z=zeros(N-K,1)
    if sum(mod(H_sp*X_',2))==0
         flag=true;
         break
    end
end
s_=X_(N-K+1:N);
end

