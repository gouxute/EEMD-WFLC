clear;
u = 0.01;
N = 30;
tsize = 5000;
w = zeros(2*N+1,1);
w0 = 0.1;

x = zeros(2*N+1,1);
T = 1;
recorde = zeros(tsize,1);
%/180*pi
for i = 1:tsize
    for j = 1:N
        x(j,1) = sin(j * w0 * i * T);
    end
    for j=N+1:2*N
        x(j,1) = cos((j-N) * w0 * i * T);
    end
    x(2 * N + 1) = 0.1;
    e = 6* cos(2*i) + 3 * sin(i+40) + 3 * sin( 2 * i+40) - w' * x;
    recorde(i) = e;
    w = w + 2 * u * e * x;
end
figure(1);
plot(recorde);
