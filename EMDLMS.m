function w1  = emdlms(id, u)
modes = evalin('base','modes');
modes1 = evalin('base','modes');
if (nargin == 1)
    u=0.0001;
end
[a1,b1] = size(modes);
x = zeros(a1,1);
[a2,b2] = size(modes1);
IMF = modes1(id,:);
iteration_times = b2;
e = 0;
w = zeros(a1,1);

for i = 1:iteration_times
    for j = 1:a1
        for k = 1:b1
            k1 = mod(floor((1+0.1*i)*k),b1);
            if( k1 == 0)
                k1 = b1;
            end
            x(j) = modes(j,k1);
        end
    end
    e = IMF(i) - w' * x;
    w = w + 2 * u * e * x;
end
w1 = w;
end