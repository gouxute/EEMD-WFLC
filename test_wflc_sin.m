clear;
u = 0.001;
u0 = 0.003;
N = 3;
tsize = 50000;
freq1 = 2.1;
freq2 = 2.1;
w0 = 1;
sumw0 = 0;
w = zeros(2*N,1);
x = zeros(2*N,1);
T = 1;
recorde = zeros(tsize,1);
sw = 0;


%/180*pi
for i = 1:tsize
    sumw0 = sumw0 + w0 ;
    t1 =1: floor(2 * pi / w0);
    or1 = t1 * 2;
    or2 = t1 *3;
    if(sw == 0)
    for j = 1:N
        x(j,1) = ff(or1,floor(j* sumw0 *  T));
    end
    for j=N+1:2*N
        x(j,1) = ff(or2,floor((j-N)* sumw0 * T));
    end
    end
    if(sw == 1)
    for j = 1:N
        x(j,1) = sin(j * w0 * i * T);
    end
    for j=N+1:2*N
        x(j,1) = cos((j-N) * w0 * i * T);
    end
    end
    e = 6* cos(freq1*i) + 1* sin(freq2*i)  - w' * x;
    %+ 3 * sin(i) + 3 * sin( 2 * i)
    %e = 3 * i - w' * x;
    sumw1 = 0;
    for j = 1:N
        sumw1 = sumw1 + j*(w(j+N,1) * x(j,1) - w(j,1) * x(N + j,1));
    end
    if(sw == 0)
    w0 = w0 - 2 * u0 * e * sumw1;
    end
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