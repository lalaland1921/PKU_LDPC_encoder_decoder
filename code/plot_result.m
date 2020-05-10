% plot(alphas,BER_a,'-*b',betas,BER_b,'-or');
% legend('Normalized Min Sum ','Offset Min Sum ');
% set(gca,'XTick',[0:0.1:1]);
% set(gca,'YTick',[0.1:0.1:0.4]);
% xlabel('alpha/beta');
% ylabel('BER');

%----------------------------BER 
% semilogy(Eb_N0,BER(1,:),'-*b',Eb_N0,BER(2,:),'-or',Eb_N0,BER(2,:),'-.y',Eb_N0,BER(2,:),'-<g');
% legend('Sum Product','Min Sum','Normalized Min Sum ','Offset Min Sum ');
% xlabel('Eb/N0(db)');
% ylabel('BER');

%--------FER
semilogy(Eb_N0,FER(1,:),'-*b',Eb_N0,FER(2,:),'-or',Eb_N0,FER(2,:),'-.y',Eb_N0,FER(2,:),'-<g');
legend('Sum Product','Min Sum','Normalized Min Sum ','Offset Min Sum ');
xlabel('Eb/N0(db)');
ylabel('FER');