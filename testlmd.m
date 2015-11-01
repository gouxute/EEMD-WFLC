u=0.0001;
M = 100;

x = zeros(8,1);
for i=1:8
    if (mod(i,2)==0)
        x = 0;
    else
        x=1;
    end
end
iteration_times = 500;
e = 0;
w = zeros(a1*b1,1);
for i = 1:iteration_times
    for j = 1:a1
        for k = 1:b1
            x((j-1)*b1 + k) = sin(ik);
        end
    end
    e = IMF(i) - w' * x;
    w = w + 2 * u * e * x;
end
w1 = w;
