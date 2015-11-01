function sig = zoomNL(x,targetT,currentT)
if (nargin==2)
    currentT = length(x);
end
x1 = linspace(1,targetT,currentT);
sig(1,:) = x1;
sig(2,:) = x;
end