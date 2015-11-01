for i=1:280
    ecg1(1,i) = ecg(i);
    if ecg(i)<=0 
        ecg1(1,i) = 0;
    end
end


Nstd = 0.2;
NR = 500;
MaxIter = 5000;


[modes its]=ceemdan(ecg1,0.2,500,5000);
t=1:length(ecg1);

[a b]=size(modes);

figure;
subplot(a+1,1,1);
plot(t,ecg1);% the ECG signal is in the first row of the subplot
ylabel('ecg1')
set(gca,'xtick',[])
axis tight;

for i=2:a
    subplot(a+1,1,i);
    plot(t,modes(i-1,:));
    ylabel (['IMF ' num2str(i-1)]);
    set(gca,'xtick',[])
    xlim([1 length(ecg1)])
end;

subplot(a+1,1,a+1)
plot(t,modes(a,:))
ylabel(['IMF ' num2str(a)])
xlim([1 length(ecg1)])

figure;
boxplot(its);


