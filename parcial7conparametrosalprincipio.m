r1=2;
r2=3;
K1=30;
K2=40;
b12=3;
b21=2;

[x, y]=solve('r1*x*(1-((x+b12*y)/K1))=0', 'r2*y*(1-((y+b21*x)/K2))=0') 

figure; hold on 
[X, Y] = meshgrid(0:1:30, 0:1:40); 
U = r1*X.*(1 - (X + b12*Y)/K1);
V = r2*Y.*(1 - (Y +b21*X)/K2);
L = sqrt((U).^2 + (V).^2);
vectorfield = quiver(X, Y, U./L, V./L, 0.4);
axis tight;
xlabel N1;
ylabel N2;
title 'gráfico parcial 7 '

x=(0:1:30); 
y1=-1/b12*x+K1/b12; 
y2=K2-b21*x; 
plot(x,y1,'r') 
plot(x, y2, 'g') 

% Yo podría cambiar las condiciones iniciales repetidas veces 
% para conseguir un gráfico ilustrativo de la situación. 
N1o=9
N2o=2

f = @(t, x) [r1*x(1)*(1 - (x(1) + b12*x(2))/K1);r2*x(2)*(1 - (x(2)+b21*x(1))/K2)];
[t, xa] = ode45(f, [0 6], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)

figure 
plot(t, xa) 


% Recuerden que, si queremos usar la estrategia de anidación 
% de loops, podríamos hacer algo así: 

f = @(t, x) [r1*x(1)*(1 - (x(1) + b12*x(2))/K1);r2*x(2)*(1 - (x(2)+b21*x(1))/K2)];

for a=5:5:30 
    for b=5:5:40 
        [t, xa] = ode45(f, [0 6], [a b]); 
        plot(xa(:,1), xa(:,2), 'LineWidth', 2) 
    end 
end 

% Aunque, modifiquen los valores, para hacer el gráfico más 
% representativo y que quede claro lo que puede estar pasando. 

