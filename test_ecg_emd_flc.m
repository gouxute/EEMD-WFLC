clear;
%u = 0.00001;
%tsize = 5000;
%--------------
%j
% u = 0.000001;
% N = 3;
% tsize = 60000;

T=1;
u = 0.0001;
N = 3;
tsize = 600000;
w = zeros(2*N,1);
x = zeros(2*N,1);
recorde = zeros(tsize,1);
w0 = 1;
 t1 =1: floor(2 * pi / w0);
    or1 = t1 ;
    or2 = t1.* t1;
 
w1 = 2;
t2 =1: floor(2 * pi / w1);
 
    target = t2 *3;
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
    e = ff(target,i+3) - w' * x;
    recorde(i) = e;
    w = w + 2 * u * e * x;
end
figure(1);
plot(recorde);
