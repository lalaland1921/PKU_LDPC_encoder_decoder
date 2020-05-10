
load('Matrix(2016,1008)Block56');
z=56;
b0=zeros(z,z);
b1=eye(z,z);
B=cat(3,b0,b1);
for i=3:1:z+1
pre=B(:,:,i-1)
now=cat(1,pre(2:z,:),pre(1,:))
B=cat(3,B,now)
end
H_block=int8(H_block);
global int8 H,N,K;

for i=1:1:36
tmp=[]
for j=1:1:18
tmp=cat(1,tmp,B(:,:,H_block(j,i)+1))
end
H=cat(2,H,tmp)
end;
H(1,18*z)=0
global Hs;
Hs=H(:,18*z+1:36*z)
[tmp,N]=size(H)
K=N-tmp
global H_sp;
if ~issparse(H) % make H sparse if it is not sparse yet
[ii,jj,sH] = find(H);
H_sp = sparse(ii,jj,sH,K,N);
H=logical(H);
end