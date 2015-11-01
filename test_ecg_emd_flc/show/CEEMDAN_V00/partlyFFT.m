% original = modes(6,795:1450);
% original1= original;
% A = fft(original1);
% 
% for i=1:563
% A1(i)=norm(A(i));
% end
% plot(A1);



start = 795;
terminal = 1450;
start1 = 77;
terminal1 =732;
num = 5;
original = modes(num,start:terminal)';
original = original / max(original);
angleRate = s(start:terminal)';
s0=conv(angleRate,original);
s1=s0;
% original(2*(terminal-start+1)-1)=0;
angleRate(2*(terminal-start+1)-1)=0;
original0=ifft(fft(s1).*fft(angleRate').^(-1))';
original(2*(terminal-start+1)-1)=0;
diff = original0' - original;
figure(5);
plot(diff);
% 
% start1=start;
% terminal1=terminal;
angleRate1 = s(start1:terminal1,1);
angleRate1(2*(terminal1-start1+1)-1)=0;

  angleRate1 = angleRate1*2;

s1=s0;
original2 =ifft(fft(s1).*fft(angleRate1).^(-1))';
original1 =  modes(num,start1:terminal1);
original1 = original1 / max(original1);
original1(2*(terminal1-start1+1)-1)=0;
diff = original2 -original1;
figure(6);
plot(diff);

angleRate = s(start:terminal)';
A=fft(angleRate);
for i=1:656
A1(i)=norm(A(i));
end
figure(6);
plot(A1);
original = modes(num,start:terminal)';
A=fft(original);
for i=1:656
A1(i)=norm(A(i));
end
figure(5);
plot(A1);
