global alpha beta BER FER;
Eb_N0=colon(-1,0.5,2);
iternum=zeros(1,7);
frame_errs=zeros(4,7);
bit_errs=zeros(4,7);
BER=zeros(4,7);
FER=zeros(4,7);

for i=1:5
    SNR=Eb_N0(i);
    frame_err=zeros(4,1);
    bit_err=zeros(4,1);
    for j=1:100
        s=get_random_source_code();
        x=encoder(s);
        d=real_BPSK(x);
        [y,LLR]=AWGN(d,SNR);
        [s_,flag]=Sum_Product(LLR,30);
        b_err=sum(s~=s_);
        bit_err(1)=bit_err(1)+b_err;
        frame_err(1)=frame_err(1)+(b_err>0);
        
        [s_,flag]=Min_Sum(LLR,30);
        b_err=sum(s~=s_);
        bit_err(2)=bit_err(2)+b_err;
        frame_err(2)=frame_err(2)+(b_err>0);
        
        [s_,flag]=Normalized_Min_Sum(LLR,alpha,30);
        b_err=sum(s~=s_);
        bit_err(3)=bit_err(3)+b_err;
        frame_err(3)=frame_err(3)+(b_err>0);
        
        [s_,flag]=Offset_Min_Sum(LLR,beta,30);
        b_err=sum(s~=s_);
        bit_err(4)=bit_err(4)+b_err;
        frame_err(4)=frame_err(4)+(b_err>0);
        
        if min(frame_err)>50
            iternum(i)=j
            break
        end
    end
    frame_errs(:,i)=frame_err;
    bit_errs(:,i)=bit_err;
end

for i=6:7
    SNR=Eb_N0(i);
    frame_err=zeros(4,1);
    bit_err=zeros(4,1);
    for j=1:1000
        s=get_random_source_code();
        x=encoder(s);
        d=real_BPSK(x);
        [y,LLR]=AWGN(d,SNR);
        
        [s_,flag]=Sum_Product(LLR,30);
        b_err=sum(s~=s_);
        bit_err(1)=bit_err(1)+b_err;
        frame_err(1)=frame_err(1)+(b_err>0);
        
        [s_,flag]=Min_Sum(LLR,30);
        b_err=sum(s~=s_);
        bit_err(2)=bit_err(2)+b_err;
        frame_err(2)=frame_err(2)+(b_err>0);
        
        [s_,flag]=Normalized_Min_Sum(LLR,alpha,30);
        b_err=sum(s~=s_);
        bit_err(3)=bit_err(3)+b_err;
        frame_err(3)=frame_err(3)+(b_err>0);
        
        [s_,flag]=Offset_Min_Sum(LLR,beta,30);
        b_err=sum(s~=s_);
        bit_err(4)=bit_err(4)+b_err;
        frame_err(4)=frame_err(4)+(b_err>0);
        
        if min(frame_err)>3
            iternum(i)=j;
            break
        end
    end
    frame_errs(:,i)=frame_err;
    bit_errs(:,i)=bit_err;
end
