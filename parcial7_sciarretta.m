
% 1.a. 
% Busco los EQUILIBRIOS igualando a cero 
syms N1 N2
[x, y]=solve('0.3*N1*(30-N1-N2)/30=0','0.2*N2*(50-N2-2*N1)/50=0')


%ISOCLINAS busco la ecuación de una recta depejando N2 para graficar
%convenientemente
solve('0.3*N1*(30-N1-N2)/30','N2')
%ans =30 - N1
solve('0.2*N2*(50-N2-2*N1)/50','N2')
% 50 - 2*N1
%Aquí agregué el despejando N1
solve('0.3*N1*(30-N1-N2)/30','N1')% 30 - N2
solve('0.2*N2*(50-N2-2*N1)/50','N1') %  25 - N2/2
 
hold on
x=(0:4:30); 
y1=30-x; %N1=x isoclina de la especie 1
y2=50 - 2*x; %isoclina de la especie 2
plot(x,y1,'r', 'LineWidth', 2) 
plot(x, y2, 'g', 'LineWidth', 2)
xlabel N1;
ylabel N2;
title 'Isoclinas '


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.b. campo dedirecciones.
 hold on 
[n1, n2] = meshgrid(0:1:32, 0:1:52); 
U = 0.3*n1.*(30-n1-n2)/30;
V = 0.2*n2.*(50-n2-2*n1)/50;
L = sqrt((U).^2 + (V).^2);
vectorfield = quiver(n1, n2, U./L, V./L, 0.4);
axis tight;
xlabel N1;
ylabel N2;
title 'Campo de Direciones'
%%%%%%%%%%%%%%%%%%

% 1.c.
% Grafico de trayectorias

%Dibujo isoclinas para agregar contexto a la trayectoria
hold on
x=(0:1:30); 
y1=30-x; %N1=x isoclina de la especie 1
y2=50 - 2*x; %isoclina de la especie 2
plot(x,y1,'r', 'LineWidth', 2) 
plot(x, y2, 'g', 'LineWidth', 2)
xlabel N1;
ylabel N2;
title 'trayectorias '

%N1o=30 y N2o=5 con un tiempo de 95
N1o=30
N2o=5
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 95], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)
%N1o=30 y N2o=5 con un tiempo de 20
N1o=30
N2o=5
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 20], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)


%N1o=5 y N2o=5 con un tiempo de 5
N1o=5
N2o=45      

f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 10], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)

%N1o=5 y N2o=45 con un tiempo de 90
N1o=5
N2o=45

f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 90], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)



%N1o=5 y N2o=5 con un tiempo de 30
N1o=5
N2o=5
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 30], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)

%N1o=5 y N2o=5 con un tiempo de 80
N1o=5
N2o=5
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 80], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)




N1o=20
N2o=10
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 20], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)

%plot(t, xa) 
%%%%%%
%1.d. campo dedirecciones combinado con el diagrama de fases e isoclinas.
 hold on 
[n1, n2] = meshgrid(0:1:32, 0:1:52); 
U = 0.3*n1.*(30-n1-n2)/30;
V = 0.2*n2.*(50-n2-2*n1)/50;
L = sqrt((U).^2 + (V).^2);
vectorfield = quiver(n1, n2, U./L, V./L, 0.4);
axis tight;
xlabel N1;
ylabel N2;
title 'Campo de Direciones y diagrama de fases'
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];

for a=5:5:30 
    for b=5:5:40 
        [t, xa] = ode45(f, [0 20], [a b]); %tiempo 20
        plot(xa(:,1), xa(:,2), 'LineWidth', 1.5) 
    end 
end 

%%%%%%%%%%%%%%%%%%%
% 1 e
% N1=70 y N2=50

figure;
[N1, N2]= meshgrid (0:2:73, 0:2:55);
U=(0.3*N1.*(30-N1-N2))/30;
V=(0.2*N2.*(50-N2-2*N1))/50;
L=sqrt((U).^2+(V).^2);
vectorfield= quiver(N1, N2, U./L, V./L, 0.4);
axis tight;
xlabel N1;
ylabel N2;

f= @(t, x)[(0.3*x(1)*(30-x(1)-x(2)))/30;(0.2*x(2)*(50-x(2)-2*x(1)))/50];
figure;axes;hold on;

[t, xa]= ode45(f, [0 100], [70 50]);
plot(xa(:,1), xa(:,2),'g', 'LineWidth', 2)

xlabel N1;
ylabel N2;
phaseportrait= gca;

figure;
copyobj(phaseportrait, gcf)
copyobj(vectorfield, gca)
axis([0 75 0 55])


% mismos N quintuplicados
figure;
[N1, N2]= meshgrid (5:6:350, 5:6:250);
U=(0.3*N1.*(30-N1-N2))/30;
V=(0.2*N2.*(50-N2-2*N1))/50;
L=sqrt((U).^2+(V).^2);
vectorfield= quiver(N1, N2, U./L, V./L, 0.4);
axis tight;
xlabel N1;
ylabel N2;

f= @(t, x)[(0.3*x(1)*(30-x(1)-x(2)))/30;(0.2*x(2)*(50-x(2)-2*x(1)))/50];
figure;axes;hold on;

[t, xa]= ode45(f, [0 100], [350 250]);
plot(xa(:,1), xa(:,2),'g', 'LineWidth', 2)

xlabel N1;
ylabel N2;
phaseportrait= gca;

figure;
copyobj(phaseportrait, gcf)
copyobj(vectorfield, gca)
axis([0 350 0 250])


%t= 0.6 con condiciones iniciales quintuplicadas  

N1o=350
N2o=250      

f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 0.6], [N1o N2o]);
plot(xa(:,1), xa(:,2),'g', 'LineWidth', 2)


[t, ya] = ode45(f, [0 0.6], [N1o N2o]);

xlabel N1;
ylabel N2;
phaseportrait= gca;

figure;
copyobj(phaseportrait, gcf)
copyobj(vectorfield, gca)
axis([0 355 0 255])
%%%%%%%%%%%
%1.f
%Dibujo isoclinas para agregar contexto a la trayectoria. En N1=20 y N2=10
%el sistema no se desvía a su capacidad de carga. Sin embargo en general
%prevalece una población a otra
hold on
x=(0:1:30); 
y1=30-x; %N1=x isoclina de la especie 1
y2=50 - 2*x; %isoclina de la especie 2
plot(x,y1,'r', 'LineWidth', 2) 
plot(x, y2, 'g', 'LineWidth', 2)
xlabel N1;
ylabel N2;
title 'trayectorias '

hold on
N1o=20
N2o=10
f = @(t, x) [ 0.3*x(1)*(30-x(1)-x(2))/30 ; 0.2*x(2)*(50-x(2)-2*x(1))/50];
[t, xa] = ode45(f, [0 0.5], [N1o N2o]);
plot(xa(:,1), xa(:,2), 'LineWidth', 2)
