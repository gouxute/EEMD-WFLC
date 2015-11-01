clear;
% u = 0.001;
% u0 = 0.003;
load('emdpre');
Te = T0;
u = 0.0001;
u0 = 0.0003;
N = 100;
tsize = 100000;
w0 = 1;
sumw0 = 0;
T = 1;
w = zeros(2*N,1);
recorde = zeros(tsize,1);
recordw = zeros(tsize,1);
x = zeros(2 * N, 1);
sw = 0;
%/180*pi
for i = 1:tsize
    sumw0 = sumw0 + w0 ;
    for j = 1:N
        x(j,1) = sin(j* sumw0 *  T);
    end
    for j=N+1:2*N
        x(j,1) = cos((j-N)* sumw0 *  T);
    end
    
    f = ecg(modsub(floor(i),Te));
    e = f  - w' * x;
    sumw1 = 0;
    for j = 1:N
         sumw1 = sumw1 + j*(w(j+N,1) * x(j,1) - w(j,1) * x(N + j,1));
    end
    w0 = w0 - 2 * u0 * e * sumw1;
    recordw(i) = w0;
    recorde(i) = e;
    w = w + 2 * u * e * x;
end
figure(1);
plot(recorde);
title('error');

figure(2);
plot(recordw);
title('weight');
w
w0