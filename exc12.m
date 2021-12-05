clear

%Input
px = [10 20 40 50 20];
py = [20 40 40 20 10];

%Draw Input
plot(px, py, '*--');

%Config
hold on;
axis equal;

%Make curve
syms t;
n = 4;

x(t) = 0 * t;
y(t) = 0 * t;

for i=0:n
    b(t) = nchoosek(n, i) * t^i * (1-t)^(n-i);
    x(t) = x(t) + px(i+1) * b(t);
    y(t) = y(t) + py(i+1) * b(t);
end
   
%Draw curve
fplot (x, y, [0, 1])

%Make Tangent vectors
%First point
v0x = n * (px(2) - px(1));
v0y = n * (py(2) - py(1));

quiver (px(1), py(1), v0x, v0y);

%Last point
v1x = n * (px(5) - px(4));
v1y = n * (py(5) - py(4));

quiver (px(5), py(5), v1x, v1y);
