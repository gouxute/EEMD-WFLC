
 rot(1,1,:) = rotf(1,:);
   rot(1,1,1) = -rotf(1,1);
     rot(1,1,2) = -rotf(1,3);
       rot(1,1,3) = -rotf(1,2);
clear tempC;
tempC(1,:) = acc(1,1,:);
for i=1:n
   y = zeros(3,3);
   y(1,1) = cos(rot(i,1,2)*pi/180);
   y(1,3) = -sin(rot(i,1,2)*pi/180);
   y(2,2) = 1;
   y(3,1) = sin(rot(i,1,2)*pi/180);
   y(3,3) = cos(rot(i,1,2)*pi/180);
   tempC = y * tempC';
   x = zeros(3,3);
   x(1,1) = 1;
   x(2,3) = sin(rot(i,1,3)*pi/180);
   x(2,2) = cos(rot(i,1,3)*pi/180);
   x(3,2) = -sin(rot(i,1,3)*pi/180);
   x(3,3) = cos(rot(i,1,3)*pi/180);
     tempC = x * tempC;
   z = zeros(3,3);
   z(1,1) = cos(rot(i,1,1)*pi/180);
   z(1,2) = sin(rot(i,1,1)*pi/180);
   z(2,1) = -sin(rot(i,1,1)*pi/180);
   z(2,2) = cos(rot(i,1,1)*pi/180);
   z(3,3) = 1;
   tempC = z * tempC;
%    T(i,:,:) = (y * x * z)';
   T(i,:,:) = (y * x * z);
end

for i=1:n
    for j=1:maxsizea
        temp(1,:) = acc(i,j,:);
        m3(:,:) = T(i,:,:);
    accgtest(i,j,:) = m3 * temp(1,:)';
    end
end


for i=1:n
figure('Number', 'off', 'Name', ['acc',num2str(i)]);
hold on;
plot(accgtest(i,:,1), 'r');
plot(accgtest(i,:,2), 'g');
plot(accgtest(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('acc');
legend('X', 'Y','Z');
end

for i=1:maxsizea
dif(1,:) = accgtest(1,i,:);
d1(i) = norm(dif(1,:));

end

figure('Number', 'off', 'Name', 'dif');
plot(d1,'r');
hold on;

