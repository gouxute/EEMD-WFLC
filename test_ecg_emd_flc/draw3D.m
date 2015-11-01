xa = -2:0.2:2;
ya = xa;
[x,y] = meshgrid(xa,ya);
z = sin(x.*y);
mesh(x,y,z);