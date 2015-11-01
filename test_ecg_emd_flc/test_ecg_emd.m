clear;
load ('ecg.mat');
Nstd = 0.2;
NR = 500;
MaxIter = 5000;
[modes its]=ceemdan(ecg,0.2,500,5000);
t=1:length(ecg);
[a b]=size(modes);
figure;
subplot(a+1,1,1);
plot(t,ecg);% the ECG signal is in the first row of the subplot
ylabel('ECG')
set(gca,'xtick',[])
axis tight;
for i=2:a
    subplot(a+1,1,i);
    plot(t,modes(i-1,:));
    ylabel (['IMF ' num2str(i-1)]);
    set(gca,'xtick',[])
    xlim([1 length(ecg)])
end;
subplot(a+1,1,a+1)
plot(t,modes(a,:))
ylabel(['IMF ' num2str(a)])
xlim([1 length(ecg)])
figure;
boxplot(its);