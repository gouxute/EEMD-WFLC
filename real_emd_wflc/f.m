function y = f(sig,x)
[a b] = min(abs(sig(1,:) - x));
y = sig(2,b);
end