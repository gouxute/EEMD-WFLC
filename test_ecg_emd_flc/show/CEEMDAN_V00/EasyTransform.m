%Directly 
% start =1507;
% terminal =2215;
% start1 = 795;
% terminal1 = 1450;
% k=1;
% for i=start1:terminal1
%     for j=start:terminal
%         if s(j) == s(i)
%          test1(k)=  modes(5,i) - modes(5,j);
%         end
%     end
%     k = k+1;
% end
% figure(7);
% plot(test1);
start =[30,749,1453];
terminal =[749,1453,2216];

% spectral divsion
interval = 700;

% f1 = modes(num,30:730);
% f2 = modes(num,749:1449;)

f1 = [modes(num,start(1):start(1)+interval-1),modes(num,start(2):start(2)+interval-1),modes(num,start(3):start(3)+interval-1)];
f2 = [modes(num,start(2):start(2)+interval-1),modes(num,start(2):start(2)+interval-1),modes(num,start(2):start(2)+interval-1)];
A = ifft(fft(f2)./fft(f1));
for i=1:length(f1)
A3(i)=norm(A(i));
end
figure(8);
plot(A3);

A = fft(f2);
for i=1:length(f1)
A4(i)=norm(A(i));
end
figure(81);
plot(A4);

A = fft(f2);
for i=1:length(f1)
A5(i)=norm(A(i));
end
figure(82);
plot(A5);


len = length(modes(num,:));
original1 = modes(num,1:len)';
A=fft(original1);
for i=1:len
A1(i)=norm(A(i));
end
figure(6);
plot(A1);

start1 = 795;
terminal1 = 1450;

original = modes(num,start1:terminal1)';
A=fft(original);
for i=1:656
A2(i)=norm(A(i));
end
figure(7);
plot(A2);




