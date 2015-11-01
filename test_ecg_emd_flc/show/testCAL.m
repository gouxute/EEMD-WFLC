len1 = length(R1);
accg1=accg;
for i=1:len
    s=10;
    j1=0;
    for j=1:len1
       if s> norm(R1(j,:)-rot(i,:))
          s =norm(R1(j,:)-rot(i,:));
          j1 = j;
       end      
    end
    accg1(i,:) = accg1(i,:) - A1(j1,:);
end
    
figure('Number', 'off', 'Name', 'AccelerationM');
hold on;
plot(accg1(:,1), 'r');
plot(accg1(:,2), 'g');
plot(accg1(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X', 'Y', 'Z');
ylim([-0.1 0.1]);
