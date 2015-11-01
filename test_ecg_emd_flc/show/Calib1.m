clear;
rot =load('E:\work\test\rot.txt');
accg =load('E:\work\test\accg.txt');
len = length(accg)
m = zeros(len,3);
m(:,1) =  medfilt1(accg(:,1), 50); 
m(:,2) =  medfilt1(accg(:,2), 50); 
m(:,3) =  medfilt1(accg(:,3), 50); 




figure('Number', 'off', 'Name', 'AccelerationM');
hold on;
plot(accg(:,1), 'r');
plot(accg(:,2), 'g');
plot(accg(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X', 'Y', 'Z');

m(1,:) = m(2,:);
figure('Number', 'off', 'Name', 'AccelerationM');
hold on;
plot(m(:,1), 'r');
plot(m(:,2), 'g');
plot(m(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X', 'Y', 'Z');



c1= floor(rot(1,:));
c2 = zeros(1,3);
c3 = zeros(len,3);
c2(1) = 1;
c2(2) = 1;
k=1;
% for i=1:len
%     if(rot(i,1) == floor(rot(i,1)) &&rot(i,2) == floor(rot(i,2))&&rot(i,3) == floor(rot(i,3)))
%      break; 
%     end
% end
% i
rot1 = floor(rot);

for i = 2:len
    tt=0;
  for j=1:i-1
  if  rot1(i,1)==rot1(j,1)&&rot1(i,2)==rot1(j,2)&&rot1(i,3)==rot1(j,3)
      tt=1;
      break;
  end
  end
  if tt~=1
    c2(2) = i;
    average = [0,0,0];
    c3(k,1)=c2(1);
    c3(k,2)=c2(2);
    if k == 12
        sss=1;
    end
    for j = c2(1):c2(2)
        average = average + m(j,:);
    end
      average = average / (c2(2)-c2(1)+1);
    c2(1) = c2(2);
    
    c1 = rot1(i,:);
    R1(k,:) =  rot1(i,:);
    A1(k,:) = average;
    k = k+1;
  end
end


figure('Number', 'off', 'Name', 'AccelerationA');
hold on;
plot(A1(:,1), 'r');
plot(A1(:,2), 'g');
% plot(A1(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X', 'Y', 'Z');
% ylim([-0.5 1.5]);

save('E:\work\test\temp\A3.txt','A1','-ascii');
save('E:\work\test\temp\R3.txt','R1','-ascii');