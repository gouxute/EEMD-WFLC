clear;
loop = 0;
wloop = zeros(500,1);
index = 1;
while (loop<2)
 loop = loop +1;

inc = loop * 0 ;
u = 0.01;
u0 = 0;
mub = 0.01;
tsize = 5000;
switch index
    case 0
        u = 0.01 + inc;
    case 1
      %  u0 = 0.01 + inc;
    case 2
        mub = 0.01 + inc;
    case 3
        tsize = 500 + inc* 1000;
end
N = 30;

w = zeros(2*N,1);
w0 = 0.1;
an = 1;
x = zeros(2*N,1);
T = 1;
recorde = zeros(tsize,1);
recordw = zeros(tsize,1);
sumw0 = 0;
wbias = 0;
%/180*pi
for i = 1:tsize
    sumw0 = w0 ; %+ w0
    for j = 1:N
        x(j,1) = sin(j * sumw0* T);
    end
    for j=N+1:2*N
        x(j,1) = cos((j-N) * sumw0 * T);
    end
  % x(2 * N +1,1) = 15;
  
    e = 6* cos(2*i) + 3 * sin(i) + 3 * sin( 3 * i) - w' * x - wbias;
    wbias = wbias + 2* mub * e;
    sumw1 = 0;
    for j = 1:N
        sumw1 = sumw1 + j*(w(j+N,1) * x(j,1) - w(j,1) * x(N + j,1));
    end
    w0 = w0+ 2 * u0 * e * sumw1;
    recordw(i) = w0;
    recorde(i) = e;
    w = w + 2 * u * e * x;
end

    
for tt = tsize/3:tsize*2/3
wloop(loop) = wloop(loop) + abs(recorde(floor(tt)));
end
wloop(loop) = wloop(loop) /  tsize*3;
% figure(1);
% plot(recorde);
% figure(2);
% plot(w);

end

[mt,nt] = min(wloop)
plot(wloop)
plot(recorde)