clear;
close all;
load('emdpre');
 Te = 10;
clear('ecg');
ecg =zoomNL( modes(1,:)+ modes(2,:),Te);
T0 = 10;
mode1 = zoomNL(modes(1,:), T0);
mode2 = zoomNL(modes(2,:), T0);

u = 0.0001;
u0 = 0.003;
%u0 = 0;
tsize = 60000;
w0 =2 * pi / 10;

[N1,M1] = size(modes);
N  = 2; 
%M = M1;
w = zeros(N,1);
x = zeros(N,1);
x1 = zeros(N,1);
pder = zeros(N,1);
dw0 = T0/M1;
recorde = zeros(tsize,1);
recordw = zeros(tsize,1);
sumw0 = 1;

for i = 1:tsize
    sumw0 = sumw0 + w0;
    y1 = modsub(sumw0,T0);
   
    
        x(1,1) = f(mode1,y1);
        x(2,1) = f(mode2,y1);
    
    if(abs( w0-2) <=0.004)
    ssss=1;    
    end
    y1 = modsub(i * 2*pi/5,Te);
    e = f(ecg,y1) - w' * x;
    pder(1) =( f(mode1,modsub(sumw0,T0)+dw0) - f(mode1,modsub(sumw0,T0)-dw0))/2 / dw0;
    pder(2) =( f(mode2,modsub(sumw0,T0)+dw0) - f(mode2,modsub(sumw0,T0)-dw0))/2/dw0;
    w0 = w0 + 2*u0*e*w'*pder;
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


% zz=linspace(0,4150);
% yy=spline(y,z,zz)