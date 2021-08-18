%3.2.1
clc
clear
load('E3.mat')
t=E3(:,1);
E3=E3(:,2);
%Grafica EMG
subplot(2,1,1);
plot(t,E3);
hold on
%Grafica Rectificada EMG
Eir3=abs(E3);
plot(t,Eir3)
grid on 
xlabel('Tiempo (t)')
ylabel("Magnitud(mV)")
legend("E3","Eir3")

%%
%3.2.2
%Filtro promedio movil
clc
clear
load('E3.mat')
t=E3(:,1);
E3=E3(:,2);
x=abs(E3');
L=length(x);
%ws1
ws1=input("Introduce numero de ventana para y1: ");
for n=ws1:1:L
    y1(n)=(1/ws1)*sum(x(n-(ws1-1):n));
end
%ws2
ws2=input("Introduce numero de ventana para y2: ");
for n=ws2:1:L
    y2(n)=(1/ws2)*sum(x(n-(ws2-1):n));
end
%ws3
ws3=input("Introduce numero de ventana para y3: ");
for n=ws3:1:L
    y3(n)=(1/ws3)*sum(x(n-(ws3-1):n));
end
subplot(2,1,2);
plot(t,y1,t,y2,t,y3)
grid on 
xlabel('Tiempo (t)')
ylabel("Magnitud(uV)")
legend("y1","y2","y3")

%3.2.4
%Para un ws=100
%u1=mean(y1(6438:7141));
u1=mean(y3(1647:2016));
%3.2.5
for i=1:L
    if y1(i)>u1
        u(i)=5;
    else
        u(i)=0;
    end
end
figure
subplot(3,1,1)
plot(t,u,"y");
ylabel("E1ac1")
grid on


for i=1:L
    if y2(i)>u1
        u(i)=5;
    else
        u(i)=0;
    end
end
subplot(3,1,2)
plot(t,u,"c");
ylabel("E1ac2")
grid on

for i=1:L
    if y3(i)>u1
        u(i)=5;
    else
        u(i)=0;
    end
end
subplot(3,1,3)
plot(t,u,"k");
grid on
xlabel('Numero de Muestras')
ylabel("E1ac3")