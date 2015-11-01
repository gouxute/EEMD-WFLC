clear;
u = 0.01;
N = 20;
tsize = 5000;
w = zeros(2*N+1,1);
w0 = 1;

x = zeros(2*N+1,1);
T = 1;
recorde = zeros(tsize,1);
sig = zeros(N,tsize);
for i = 1:N
    t = 1:1:tsize;
    sig(i,:) = sin(i*t*w0/180*pi);
    sig(i+N,:) = cos(i*t*w0/180*pi);
end

% 
%  for j = 1:N
%         x(j,1) = sin(j * w0 * i * T);
%     end
%     for j=N+1:2*N
%         x(j,1) = cos((j-N) * w0 * i * T);
%     end

%/180*pi
for i = 1:tsize
   
    e = 6* cos(2*i/180*pi) + 3 * sin(i/180*pi) + 3 * sin(20 * i/180*pi) - w' * sig(:,i);
    recorde(i) = e;
    w = w + 2 * u * e * sig(:,i);
end
figure(1);
plot(recorde);


fs=20000; %参样频率
f=50; %信号频率
Ts=1/fs;%参样时间
t=0:Ts:4095*Ts;
D=9.1; %噪声强度
s=sin(2*pi*f*t); %信号搜索
x = awgn(s,50);
figure(1)
plot(t,s);
figure(2)
plot(t,x);