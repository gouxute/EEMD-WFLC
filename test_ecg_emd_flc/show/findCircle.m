clear;
accg =load('E:\work\test\accg.txt');
rot =load('E:\work\test\rot.txt');
n = length(rot);
i1=-180;
t=1;
j1=1;
m(1,1)=0;
while i1<=180&&i1>=-180
    for i= 1:n
        if rot(i,1)<=i1+60 && rot(i,1)>=i1
          m(j1,1) = accg(i,1);
          j1 = j1+1;
        end
    end
    i1 = i1 +60;
    t=t+1;
end
