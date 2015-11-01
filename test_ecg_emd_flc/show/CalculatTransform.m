clear;
rot =load('E:\work\test\dis\rot.txt');
acc =load('E:\work\test\dis\acc.txt');
m = length(rot);
m = m-1;

    i=2;
    a = rot(i,1)*pi/180;
    y = -rot(i,2)*pi/180;
    b = rot(i,3)*pi/180;
   
    Mx1 = [1,0,0;0,cos(b),sin(b);0,-sin(b),cos(b)];
    My1 = [cos(y),0,-sin(y);0,1,0;sin(y),0,cos(y)];
    Mz1 = [cos(a),sin(a),0;-sin(a),cos(a),0;0,0,1;];
    
    
    acct1 = acc(i,:);
    acct1 = inv(My1*Mx1*Mz1)*acct1'

%     plot3([0,acct(1)],[0,acct(2)],[0,acct(3)],'r');
%         figure('Name','a');
%         grid on;
%      N=1;
%      axis([-N N -N N -N N]);
%     hold on;
%     acct = inv(Mz1)*acct';
%     plot3([0,acct(1)],[0,acct(2)],[0,acct(3)],'k');
%     hold on;
%     acct = inv(My1)*acct;
%     plot3([0,acct(1)],[0,acct(2)],[0,acct(3)],'b');
%     hold on;
%     acct = inv(Mx1)*acct;
%     plot3([0,acct(1)],[0,acct(2)],[0,acct(3)],'y');
% 
% inv(Mz1)*inv(My1)*inv(Mx1)
%     
%     M1 = Mz1* My1* Mx1;
%     
%     Mx1(:,:,i) = [1,0,0;0,cos(b),sin(b);0,-sin(b),cos(b)];
%     My1(:,:,i) = [cos(y),0,-sin(y);0,1,0;sin(y),0,cos(y)];
%     Mz1(:,:,i) = [cos(a),sin(a),0;-sin(a),cos(a),0;0,0,1;];
%     M1(:,:,i) = Mz1(:,:,i)* My1(:,:,i)* Mx1(:,:,i) ;
%         
%     M(:,:,i) = [cos(y)*cos(a) + sin(y)* sin(b)*sin(a), cos(y)*sin(a)-sin(y)*sin(b)*cos(a), sin(y)*cos(b);
%             -cos(b)*sin(a) , cos(b)*cos(a), sin(b);
%             -sin(y)*cos(a) + +cos(y)*sin(b)*sin(a), -sin(y)*sin(a) - cos(y) * sin(b)*cos(a), cos(y)*cos(b)];





for i=1:m
accg5(:,i) =  inv(M(:,:,i)) * acc(i,:)';
%accg5(:,i) = accg5(:,i)-[0.0099;0.0108;0.9313];
end
accg5 = accg5';
save('E:\work\test\dis\accg5.txt','accg5','-ascii') ;
% 
% accg2 = load('E:\work\test\dis\accg2.txt')
% accg2-accg5
% mean(ans)
for i=1:m
la(i)= norm(acc(i,:));
end
for i=1:m
lag(i)= norm(accg5(i,:));
end
mean(lag);

 
    Mx = sym('[1,0,0;0,cos(-b),sin(-b);0,-sin(-b),cos(-b)]');
    My=  sym('[cos(-y),0,-sin(-y);0,1,0;sin(-y),0,cos(-y)]');
    Mz = sym('[cos(-a),sin(-a),0;-sin(-a),cos(-a),0;0,0,1;]');
%     a= -a 
%     y=-y
%     b= -b
    M = Mz * My * Mx 
    
    