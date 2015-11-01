clear;
accg =load('E:\work\test\accg1.txt');
% vel =load('E:\work\test\velocity.txt');
% dis =load('E:\work\test\displace.txt');
% error =load('E:\work\test\aerror.txt');
rot =load('E:\work\test\rot1.txt');
    

A=fspecial('average',[3,1]); %生成系统预定义的3X3滤波器  

Y=filter2(A,accg(:,1));           %用生成的滤波器进行滤波,并归一化  

m(:,1) =  medfilt1(accg(:,1), 5); 
m(:,2) =  medfilt1(accg(:,2), 1); 
m(:,3) =  medfilt1(accg(:,3), 10); 
t(:,:)=mean(accg(:,:))

[s1,s2]=max(accg(:,3));



figure('Number', 'off', 'Name', 'Rotation');
hold on;
plot(rot(:,1), 'r');
plot(rot(:,2), 'g');
plot(rot(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Rotation');
legend('Z', 'Y', 'X');

figure('Number', 'off', 'Name', 'Acceleration1X');
hold on;
plot(accg(:,1), 'r');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X');

figure('Number', 'off', 'Name', 'Acceleration1Xm');
hold on;
plot(m(:,1), 'r');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X');



figure('Number', 'off', 'Name', 'Acceleration1XA');
hold on;
plot(Y(:,1), 'r');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X');


figure('Number', 'off', 'Name', 'Acceleration1Y');
hold on;
plot(accg(:,2), 'g');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend( 'Y');


figure('Number', 'off', 'Name', 'Acceleration1Z');
hold on;
plot(accg(:,3), 'r');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('Z');


figure('Number', 'off', 'Name', 'Acceleration1m');
hold on;
plot(m(:,3), 'r');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('Z');

  mean(accg)

% 
% 
% figure('Number', 'off', 'Name', 'velocity');
% hold on;
% plot(vel(:,1), 'r');
% plot(vel(:,2), 'g');
% plot(vel(:,3), 'b');
% xlabel('sample');
% ylabel('g');
% title('Linear velocity');
% legend('X', 'Y', 'Z');
% 
% 
% figure('Number', 'off', 'Name', 'displace');
% hold on;
% plot(dis(:,1), 'r');
% plot(dis(:,2), 'g');
% plot(dis(:,3), 'b');
% xlabel('sample');
% ylabel('g');
% title('Linear displace');
% legend('X', 'Y', 'Z');
%  
%  ylim([--0 200]);


m = length(accg);
for i=1:m
alength(i) = norm(accg(i,:));
end

figure('Name','alength')
hold on;
plot(alength);
hold on;
plot(alength,'*');

% 
% m = length(accg);
% for i=2:m
% incline(i) =abs(norm(accg(i,:))-norm(accg(i-1,:)))/1;
% end
% max(abs(incline()))
% 
% figure('Name','incline')
% hold on;
% plot(incline);
% hold on;
% plot(incline,'*');
% 
% for i=1:60
% incline(i) = (norm(accg(i,:))-norm(accg(i+1,:)))/1;
% end
% min(abs(incline()))

% for i=70:115
% incline1(i-69) = (norm(accg(i,:))-norm(accg(i+1,:)))/1;
% end
% min(abs(incline1()))