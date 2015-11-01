function [sig] = prolong(f,currentT,L)
[M,N] = size(f);
if(nargin==2)
    currentT = max(M,N);
    sig1 = f;
    sig = f;
    for i = 1: L/currentT-1
        if(N==1)
        sig = [sig;sig1];
        end
        if(M == 1)
        sig = [sig,sig1];
        end
    end
end