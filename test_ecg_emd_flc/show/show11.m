

A=fspecial('average',[1,3]); %生成系统预定义的3X3滤波器  
accga(:,1)=filter2(A,accgr(1,:,1));           %用生成的滤波器进行滤波,并归一化  
accga(:,2)=filter2(A,accgr(1,:,2));           %用生成的滤波器进行滤波,并归一化  
accga(:,3)=filter2(A,accgr(1,:,3));           %用生成的滤波器进行滤波,并归一化  
% accga(:,1) =  medfilt1(accg(1,:,1), 5); 
% accga(:,2) =  medfilt1(accg(1,:,2), 5); 
% accga(:,3) =  medfilt1(accg(1,:,3), 5); 
for i=1:n
figure('Number', 'off', 'Name', ['accga',num2str(i)]);
hold on;
plot(accga(:,1), 'r');
plot(accga(:,2), 'g');
plot(accga(:,3), 'b');
xlabel('sample');
ylabel('g');
title('accg');
legend('X', 'Y', 'Z');
% ylim([-0.6 1.2]);
end

lvel(1,:) = [0,0,0];
for i=2:length(accga)
    lvel(i,:) = lvel(i-1,:) + accga(i,:) +[0.0306 ,0.0054, - 0.9958];
    
end

for i=1:n
figure('Number', 'off', 'Name', ['dis',num2str(i)]);
hold on;
plot(lvel(:,1), 'r');
plot(lvel(:,2), 'g');
plot(lvel(:,3), 'b');
xlabel('sample');
ylabel('g');
title('dis');
legend('X', 'Y', 'Z');
end