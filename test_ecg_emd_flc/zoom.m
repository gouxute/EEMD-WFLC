function [sigg ]= zoom(f,T,currentT)
% T is the target period
% currentT is the current period
[M,N] = size(f);
if(nargin==2)
    currentT = max(M,N);
end
if(M ==1)
sig = zeros(1,T);
end
if(N ==1)
sig = zeros(T,1);
end
for i = 1: T
    if(M ==1)
    sig(i) = f(floor(i*currentT/T));
    end
    if(N ==1)
    sig(i) = f(floor(i*currentT/T));
    end
end
if(nargin ==4)
     sig1 = sig;
    for i = 1: L/T-1
        if(N==1)
        sig = [sig;sig1];
        end
        if(M == 1)
        sig = [sig,sig1];
        end
    end

end
sigg = sig;
end