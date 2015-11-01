len = length(accg)
m = zeros(len,3);
m(:,1) =  medfilt1(accg(:,1), 50); 
m(:,2) =  medfilt1(accg(:,2), 50); 
m(:,3) =  medfilt1(accg(:,3), 50); 


figure('Number', 'off', 'Name', 'Acceleration1');
hold on;
plot(m(:,1), 'r');
plot(m(:,2), 'g');
plot(m(:,3), 'b');
xlabel('sample');
ylabel('g');
title('Linear acceleration');
legend('X', 'Y', 'Z');
ylim([-0.5 1.5]);

len = len-1;
c1= floor(rot(1,:));
c2 = zeros(1,2);
c2(1) = 1;
c2(2) = 1;
k=0;
for i = 1:len
  if c1(1,1)+0.5 <= floor(rot(i,1))||c1(1,2)+0.5<= floor(rot(i,2))||c1(1,3)+0.5<= floor(rot(i,3))
      c2(2) = i;
      average = [0,0,0];
    for j = c2(1):c2(2)
        average = average + m(j);
    end
      average = average / (c2(2)-c2(1));
    c2(1) = c2(2);
    k = k+1;
    c1 = c1 + [0.5,0.5,0.5];
    R(k) = c1;
    A(k) = average;
  end
end