global K BER_a BER_b alpha beta;
alphas=colon(0,0.1,1);
betas=colon(0,0.1,1);
BER_a=zeros(1,11);
BER_b=zeros(1,11);
SNR=1.3;
iternum=30;
k=1
for i=1:11
    alpha=alphas(i);
    bit_err=0;
    for j=1:50
        s=get_random_source_code();
        x=encoder(s);
        d=real_BPSK(x);
        [y,LLR]=AWGN(d,SNR);
        [s_,flag]=Normalized_Min_Sum(LLR,alpha,iternum);
        bit_err=bit_err+sum(s_~=s);
    end
    BER_a(i)=bit_err/(50*K);
    if BER_a(i)<BER_a(k)
        k=i
    end
end
alpha=alphas(k)
k=1
for i=1:11
    bit_err=0;
    beta=betas(i);
    for j=1:50
        s=get_random_source_code();
        x=encoder(s);
        d=real_BPSK(x);
        [y,LLR]=AWGN(d,SNR);
        [s_,flag]=Offset_Min_Sum(LLR,beta,iternum);
        bit_err=bit_err+sum(s_~=s);
    end
    BER_b(i)=bit_err/(50*K);
    if BER_b(i)<BER_b(k)
        k=i
    end
end 
betbetas(k)