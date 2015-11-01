% partial derivate
function g = pd(x,dt,currentT)
 [M,N] = size(x);
 
 targetT = currentT + dt;
 zoom(x,currentT,targetT,length(x));
 end