% function [d1]=testEMD(modes)
sb=1000;

for i=1:11
     for j=1:11
        for k=1:11
            d1 = modes(i,:)+modes(j,:)+modes(k,:);
            d2 = accg(:,1)' - d1;
         
            if sb>norm(d2);
                sb = norm(d2);
                m=i;
                 n=j;
               l=k;
            end
          end
   end
end
 d1 = modes(m,:)+modes(n,:)+modes(l,:);
            d2 = accg(:,1)' - d1;
figure('Name','Recover with certain imf')
subplot(3,1,1);
plot(d1);
ylim([-0.3 0.3]);
subplot(3,1,2);
plot(accg(:,1));
ylim([-0.3 0.3]);
subplot(3,1,3);
plot(d2);
ylim([-0.3 0.3]);

figure('Name','mode')
subplot(3,1,1);
plot(modes(m,:));
ylim([-0.3 0.3]);
subplot(3,1,2);
plot(modes(n,:));
ylim([-0.3 0.3]);
subplot(3,1,3);
plot(modes(l,:));
ylim([-0.3 0.3]);

figure('Number', 'off', 'Name', 'RotA');
hold on;
xlabel('sample');
ylabel('g');
title('RotationA');
legend('X');
s(:,1) =  medfilt1(diff(rot(:,1)),5); 
plot(s(:,1));



figure(5);
plot(rot(:,1));