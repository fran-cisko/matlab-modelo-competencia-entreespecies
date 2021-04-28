
%1.a. busco los equilibrios igualando a cero y luego haceiendo un campo de
%direcciones.
syms N1 N2
[x, y]=solve('0.3*N1*(30-N1-N2)/30=0','0.2*N2*(50-N2-2*N1)/50=0')

figure; hold on 
[n1, n2] = meshgrid(0:1:32, 0:1:52); 
U = 0.3*n1.*(30-n1-n2)/30;
V = 0.2*n2.*(50-n2-2*n1)/50;
L = sqrt((U).^2 + (V).^2);
vectorfield = quiver(n1, n2, U./L, V./L, 0.4);
axis tight;
xlabel N1;
ylabel N2;
title 'gráfico parcial 7 '

%ISOCLINAS busco la ecuación de una recta depejando N2 para graficar
%convenientemente
solve('0.3*N1*(30-N1-N2)/30','N2')
%ans =30 - N1
solve('0.2*N2*(50-N2-2*N1)/50','N2')
% 50 - 2*N1
 

x=(0:1:30); 
y1=30-x; %N1=x isoclina de la especie 1
y2=50 - 2*x; %isoclina de la especie 2
plot(x,y1,'r', 'LineWidth', 2) 
plot(x, y2, 'g', 'LineWidth', 2)

% Grafico de trayectorias
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];

for a=5:5:30 
    for b=5:5:40 
        [t, xa] = ode45(f, [0 20], [a b]); %tiempo 20
        plot(xa(:,1), xa(:,2), 'LineWidth', 1.5) 
    end 
end 

%%%%%%%%%%%%%%%%%%%
% 1 e
hold on
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
     [t, xa] = ode45(f, [0 0.6], [70 50]);
      plot(xa(:,1), xa(:,2), 'r')
      
     [t, ya] = ode45(f, [0 15], [0.6 (0.6*5);
      plot(ya(:,1), ya(:,2), 'g')
      