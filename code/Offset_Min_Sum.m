function [  s_,flag ] = Offset_Min_Sum( LLR,beta,iternum )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
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
        u(H(j,:))=(signs/total_sign).*max(min_value-beta,0);
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
end

