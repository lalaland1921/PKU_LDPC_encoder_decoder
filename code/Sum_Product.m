function [ s_,flag ] = Sum_Product( LLR,iternum )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%version3
global H_sp H K N;
flag=false;
U=zeros(N-K,N);
% for i=1:N-K
%     U(i,:)=(LLR(H(i,:)))'
% end
rep_LLR=repmat(LLR,N-K,1);
U(H)=rep_LLR(H);
% if ~issparse(U) % make U sparse if it is not sparse yet
% [ii,jj,sH] = find(U);
% U= sparse(ii,jj,sH,N-K,N);
% end
% [ind_l,i]=size(ii)
V=zeros(N-K,N);
u_sum=sum(U)+LLR;
for i=1:iternum    
    for j=1:N
        v=V(:,j);
        u=U(:,j);
        v(H(:,j))=u_sum(1,j)-u(H(:,j));
        V(:,j)=v;
        
    end
    tanh_V=zeros(N-K,N);
    tanh_V(H)=tanh(V(H)/2);
    %pro=zeros(N-K,1);
    for j=1:N-K
        tanh_v=tanh_V(j,:);
        u=U(j,:);        
        pro=prod(tanh_v(H(j,:)));      
        u(H(j,:))=2*min(atanh(pro./tanh_v(H(j,:))),10000);
        U(j,:)=u;
    end
    u_sum=sum(U)+LLR;
    X_=u_sum<0;  
    if sum(mod(H_sp*X_',2))==0
         flag=true;
         break
    end
end
s_=X_(N-K+1:N);
%version 1
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
%     tan_v=tanh(V/2);
%     v_pro=ones(1,N-K);
%     for j=1:1:ind_l
%         tmp=index(j,:);
%         m=tmp(1,1);
%         n=tmp(1,2);
%         v_pro(1,m)=v_pro(1,m)*tan_v(1,j)
%     end
%     for j=1:1:ind_l
%         tmp=index(i,:);
%         m=tmp(1,1);
%         n=tmp(1,2);
%         U(1,j)=2*atanh(v_pro(1,m)/tan_v(1,j))
%     end
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
%-------------------------------------
%version2
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
%-------------------------------------------


end

