clear;
close all;
load('emdpre');
%ecg = zoom(ecg1',3 * T0);
ecg1 = acc(:,2);
Te = T0;
ecg = zoom(ecg1', Te);
ecg = modes(1,:) + modes(2,:);
u = 0.0001;
u0 = 0.0003;
%u0 = 0;
tsize = 500000;
w0 = 1;


[N1,M1] = size(modes);
N  = 2; M = M1;
w = zeros(N,1);
x = zeros(N,1);
x1 = zeros(N,1);
pder = zeros(N,1);
dw0 = 1;
recorde = zeros(tsize,1);
recordw = zeros(tsize,1);
sumw0 = 0;

for i = 1:tsize
    sumw0 = sumw0 + w0;
    y = modsub(floor(sumw0),T0);
    for j = 1:N
        x(j,1) = modes(j,y);
    end
    y1 = modsub(floor(i),Te);
    e = ecg(y1) - w' * x;
    sumw01 = sumw0+ 0.00001;
    for j=1:N
    pder(j) =( modes(j,modsub(ceil(sumw01),T0)) - modes(j,modsub(floor(sumw01),T0)))/dw0;
    end
    w0 = w0 - 2*u0*e*w'*pder;
    
    recordw(i) = w0;
    recorde(i) = e;
    w = w + 2 * u * e * x;
end
figure(5);

plot(recorde);
title('error');

figure(6);
plot(recordw);
title('weight');
w
w0





