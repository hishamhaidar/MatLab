clear

px = [10 20 40 50 20];
py = [20 40 40 20 10];
t1 = 0;t2 = 1;t3 = 2;t4 = 3;t5 = 4;
%config
axis equal;
hold on;
%draw points
plot (px, py, 'b*');
%X
syms a4 a3 a2 a1 a0
ex = [a4*t1^4 + a3*t1^3 + a2*t1^2 + a1*t1 + a0 == px(1), ...
      a4*t2^4 + a3*t2^3 + a2*t2^2 + a1*t2 + a0 == px(2), ...
      a4*t3^4 + a3*t3^3 + a2*t3^2 + a1*t3 + a0 == px(3), ...
      a4*t4^4 + a3*t4^3 + a2*t4^2 + a1*t4 + a0 == px(4),...
      a4*t5^4 + a3*t5^3 + a2*t5^2 + a1*t5 + a0 == px(5)];  
%Solve equation
rx = solve(ex, [a4 a3 a2 a1 a0]);

syms t
x(t) = rx.a4*t^4 + rx.a3*t^3 + rx.a2*t^2 + rx.a1*t + rx.a0;
 
%Y
syms b4 b3 b2 b1 b0
ey = [b4*t1^4 + b3*t1^3 + b2*t1^2 + b1*t1 + b0 == py(1), ...
      b4*t2^4 + b3*t2^3 + b2*t2^2 + b1*t2 + b0 == py(2), ...
      b4*t3^4 + b3*t3^3 + b2*t3^2 + b1*t3 + b0 == py(3), ...
      b4*t4^4 + b3*t4^3 + b2*t4^2 + b1*t4 + b0 == py(4),...
      b4*t5^4 + b3*t5^3 + b2*t5^2 + b1*t5 + b0 == py(5) ];
  
%Solve equation
ry = solve(ey, [b4 b3 b2 b1 b0]);
y(t) = ry.b4*t^4 + ry.b3*t^3 + ry.b2*t^2 + ry.b1*t + ry.b0;

%Draw it!
fplot (x, y, [t1 t5]);

%tangent
dx(t)=diff(x,t);
dy(t)=diff(y,t);
vx=[dx(t5)];
vy=[dy(t5)];
quiver(px(5),py(5),vx,vy,'y')
