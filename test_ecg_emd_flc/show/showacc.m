str1a = 'E:\work\test\acc';
str1r ='E:\work\test\rot';

str2 = '.txt';

for i=1:n
   acct =load([str1a,num2str(i),str2]);
    lengtha(i) = length(acct);
       rott =load([str1r,num2str(i),str2]);
    lengthr(i) = length(rott);
    
    
end
maxsizea = max(lengtha);
maxsizer = max(lengthr);
for i=1:n
   acct = load([str1a,num2str(i),str2]);
   acct(maxsizea,:) = [0,0,0];
   acc(i,:,:) = acct;
   
    rott = load([str1r,num2str(i),str2]);
   rott(maxsizer,:) = [0,0,0];
   rotg(i,:,:) = rott;
   
end


for i=1:n
figure('Number', 'off', 'Name', ['acc',num2str(i)]);
hold on;
plot(acc(i,:,1), 'r');
plot(acc(i,:,2), 'g');
plot(acc(i,:,3), 'b');
xlabel('sample');
ylabel('g');
title('acc');
legend('X', 'Y', 'Z');

% 
% figure('Number', 'off', 'Name', ['rot',num2str(i)]);
% hold on;
% plot(rot(i,:,1), 'r');
% plot(rot(i,:,2), 'g');
% plot(rot(i,:,3), 'b');
% xlabel('sample');
% ylabel('g');
% title('rot');
% legend('X', 'Y', 'Z');

end
