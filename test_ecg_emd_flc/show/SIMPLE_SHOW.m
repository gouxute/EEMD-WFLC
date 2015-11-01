clear;
str1a = 'E:\work\test\accg';
str1ar = 'E:\work\test\accgr';
str1r ='E:\work\test\rot';
str1v ='E:\work\test\velocity';
str1d ='E:\work\test\displace';
str2 = '.txt';
n = 1;
for i=1:n
   accgt = load([str1a,num2str(i),str2]);
  
   accg(i,:,:) = accgt;
   
   accgrt = load([str1ar,num2str(i),str2]);
  
   accgr(i,:,:) = accgrt;
   
   
   rott = load([str1r,num2str(i),str2]);
  
   rot(i,:,:) = rott;
   
   velt = load([str1v,num2str(i),str2]);
  
   vel(i,:,:) = velt;
   
   dist = load([str1d,num2str(i),str2]);
  
   dis(i,:,:) = dist;
end


for i=1:n

figure('Number', 'off', 'Name', ['accgr',num2str(i)]);
hold on;
plot(accgr(i,:,1), 'r');
plot(accgr(i,:,2), 'g');
plot(accgr(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('accgr');
legend('X', 'Y', 'Z');


figure('Number', 'off', 'Name', ['accgr',num2str(i)]);
hold on;
plot(rot(i,:,1), 'r');
plot(rot(i,:,2), 'g');
plot(rot(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('accgr');
legend('X', 'Y', 'Z');

figure('Number', 'off', 'Name', ['vel',num2str(i)]);
hold on;
plot(vel(i,:,1), 'r');
plot(vel(i,:,2), 'g');
plot(vel(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('dis');
legend('X', 'Y', 'Z');

figure('Number', 'off', 'Name', ['dis',num2str(i)]);
hold on;
plot(dis(i,:,1), 'r');
plot(dis(i,:,2), 'g');
plot(dis(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('dis');
legend('X', 'Y', 'Z');

end
