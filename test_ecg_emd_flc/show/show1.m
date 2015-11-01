clear;
str1a = 'E:\work\test\accg';
str1ar = 'E:\work\test\accgr';
str1r ='E:\work\test\rot';
str1v ='E:\work\test\velocity';
str1d ='E:\work\test\displace';
str2 = '.txt';
n = 1;
for i=1:n
   accgt =load([str1a,num2str(i),str2]);
    lengtha(i) = length(accgt);
     accgrt =load([str1ar,num2str(i),str2]);
    lengthar(i) = length(accgrt);
    rott =load([str1r,num2str(i),str2]);
    lengthr(i) = length(rott);
    velt =load([str1a,num2str(i),str2]);
    lengthv(i) = length(velt);
    dist =load([str1r,num2str(i),str2]);
    lengthd(i) = length(dist);
    
end
maxsizea = max(lengtha);
maxsizear = max(lengthar);
maxsizer = max(lengthr);
maxsizev = max(lengthv);
maxsized = max(lengthd);
for i=1:n
   accgt = load([str1a,num2str(i),str2]);
   accgt(maxsizea,:) = [0,0,0];
   accg(i,:,:) = accgt;
   
   accgrt = load([str1ar,num2str(i),str2]);
   accgrt(maxsizer,:) = [0,0,0];
   accgr(i,:,:) = accgrt;
   
   
   rott = load([str1r,num2str(i),str2]);
   rott(maxsizer,:) = [0,0,0];
   rot(i,:,:) = rott;
   
   velt = load([str1v,num2str(i),str2]);
   velt(maxsizev,:) = [0,0,0];
   vel(i,:,:) = velt;
   
   dist = load([str1d,num2str(i),str2]);
   dist(maxsized,:) = [0,0,0];
   dis(i,:,:) = dist;
end


for i=1:n
figure('Number', 'off', 'Name', ['accg',num2str(i)]);
hold on;
plot(accg(i,:,1), 'r');
plot(accg(i,:,2), 'g');
plot(accg(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('accg');
legend('X', 'Y', 'Z');

figure('Number', 'off', 'Name', ['accgr',num2str(i)]);
hold on;
plot(accgr(i,:,1), 'r');
plot(accgr(i,:,2), 'g');
plot(accgr(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('accgr');
legend('X', 'Y', 'Z');
end


for i=1:n
figure('Number', 'off', 'Name', ['vel',num2str(i)]);
hold on;
plot(vel(i,:,1), 'r');
plot(vel(i,:,2), 'g');
plot(vel(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('dis');
legend('X', 'Y', 'Z');
end


for i=1:n
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
rotf(1,:) = rot(1,1,:);
% mean(accg(1,:,:))