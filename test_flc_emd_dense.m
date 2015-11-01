clear;
T=1;
u = 0.00017;
N = 3;
tsize = 1000000;
w = zeros(2*N,1);
x = zeros(2*N,1);
recorde = zeros(tsize,1);
recordw = zeros(6,tsize);
w0 = 1;
t1 =1: floor(2 * pi / w0);
    or1 = t1.*t1 + t1 ;
    %or2 = 2 * t1 ;
    or2 = t1.* t1;
 
w1 = 1;
t2 =1: floor(2 * pi / w1);
 
    target = t2.*t2 *3 + 5 *t2;
%/180*pi
for i = 1:tsize
    index = mod(i,length(t1));
    for j = 1:N
        x(j,1) = ff(or1,ceil(j* w0 * i *  T));
      
    end
    for j=N+1:2*N
        x(j,1) =  ff(or2,ceil((j-N)* w0 * i * T));
    end
    if( i == 50000)
        stop = 1;
    end
   % x(2 * N + 1) = 0.1;
    e = ff(target+2,i) - w' * x;
    recorde(i) = e;
    recordw(:,i) = w;
    w = w + 2 * u * e * x;
end
figure(1);
plot(recorde);
figure(2);
plot(recordw(1,:));
hold on;
plot(recordw(2,:));
hold on;
plot(recordw(3,:));
hold on;
plot(recordw(4,:));
hold on;
plot(recordw(5,:));
hold on;
plot(recordw(6,:));
hold on;