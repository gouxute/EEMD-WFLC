clear;
A1 =load('E:\work\test\temp\A3.txt');
A2 =load('E:\work\test\temp\A2.txt');
R1 =load('E:\work\test\temp\R3.txt');
R2 =load('E:\work\test\temp\R2.txt');
k=1;

for i=1:400
    for j=1:400
    if R1(i,1)==R2(j,1)&&R1(i,2)==R2(j,2)&&R1(i,3)==R2(j,3)
       AA(k,:) = A1(i,:)-A2(j,:);
       k=k+1;
    end
    end
end

figure('Number', 'off', 'Name', 'Acceleration1');
hold on;
plot(AA(:,1), 'r');
plot(AA(:,2), 'g');
plot(AA(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X', 'Y', 'Z');
 


% 
% 
% accg1 =load('E:\work\test\accg.txt');
% accg2 =load('E:\work\test\accg.txt');
% t = zeros(3,3);
% accg2 = [accg2;t];
% A2 = accg1-accg2;