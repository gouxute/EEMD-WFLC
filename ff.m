function x = ff(org,t)
index = mod(t,length(org));
if(index == 0)
    index = length(org);
end
x = org(index);
end