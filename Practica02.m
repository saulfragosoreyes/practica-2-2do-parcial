close all
clear all 
clc

%introducir grados y distancia del primer eslabon
prompt = 'Introducir el valor (grados) del ángulo 1:';
angDeg = input (prompt);
prompt = 'Introducir el valor (grados) del ángulo 2:';
angDeg2 = input (prompt);
prompt = 'Introducir el valor L1:';
L1 = input (prompt);
angRad = deg2rad(angDeg);
prompt = 'Introducir el valor L2:';
L2 = input (prompt);
angRad2 = deg2rad(angDeg2);

%imprimir ejes 2D
printAxis()

%definir punto inicial
p1 =[0 0 0]';

%verificacion del angulo y creacion del vector
if angDeg>=0
    angVec = 0:0.1:angRad;
else 
    angVec = 0:-0.1:angRad;
end
%Movimiento del Primer Eslabon
for i=1:length(angVec)
clf
printAxis();
TRz1 = [cos(angVec(i)) -sin(angVec(i)) 0 0; sin(angVec(i)) cos(angVec(i)) 0 0; 0 0 1 0; 0 0 0 1];
TTx1 = [1 0 0 L1; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T1 = TRz1*TTx1;
p2 = T1(1:3,4);
eje_x_1 = T1(1:3,1)
eje_y_1 = T1(1:3,2)
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 1 0],'linewidth',3)
line([p1(1) eje_x_1(1)],[p1(2) eje_x_1(2)],[p1(3) eje_x_1(3)],'color',[1 0 1],'linewidth',3)
line([p1(1) eje_y_1(1)],[p1(2) eje_y_1(2)],[p1(3) eje_y_1(3)],'color',[0.5 0 1],'linewidth',3)
    
   
TRz2 = [cos(0) -sin(0) 0 0; sin(0) cos(0) 0 0; 0 0 1 0; 0 0 0 1];
TTx2 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T2 = TRz2*TTx2;
Tf = T1*T2;
p3 = Tf(1:3,4);
eje_x_2 = p2+Tf(1:3,1)
eje_y_2 = p2+Tf(1:3,2)
eje_x_3 = p3+Tf(1:3,1)
eje_y_3 = p3+Tf(1:3,2)
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 0 0],'linewidth',3)
line([p2(1) eje_x_2(1)],[p2(2) eje_x_2(2)],[p2(3) eje_x_2(3)],'color',[1 0 1],'linewidth',3)
line([p2(1) eje_y_2(1)],[p2(2) eje_y_2(2)],[p2(3) eje_y_2(3)],'color',[0.5 0 1],'linewidth',3)
line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[1 0 1],'linewidth',3)
line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[0.5 0 1],'linewidth',3)
      
pause (0.1)
grid on
end

if angDeg2>=0
    angVec2 = 0:0.1:angRad2;
else 
    angVec2 = 0:-0.1:angRad2;
end

T1 = TRz1*TTx1;

%Movimiento del Segundo Eslabon
for i=1:length(angVec2)
clf
printAxis();
p2 = T1(1:3,4);
eje_x_1 = T1(1:3,1)
eje_y_1 = T1(1:3,2)
line([p1(1) p2(1)],[p1(2) p2(2)],[p1(3) p2(3)],'color',[1 1 0],'linewidth',3)
line([p1(1) eje_x_1(1)],[p1(2) eje_x_1(2)],[p1(3) eje_x_1(3)],'color',[1 0 1],'linewidth',3)
line([p1(1) eje_y_1(1)],[p1(2) eje_y_1(2)],[p1(3) eje_y_1(3)],'color',[0.5 0 1],'linewidth',3)
        
TRz2 = [cos(angVec2(i)) -sin(angVec2(i)) 0 0; sin(angVec2(i)) cos(angVec2(i)) 0 0; 0 0 1 0; 0 0 0 1];
TTx2 = [1 0 0 L2; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T2 = TRz2*TTx2;
Tf = T1*T2;
p3 = Tf(1:3,4);
eje_x_2 = p2+Tf(1:3,1)
eje_y_2 = p2+Tf(1:3,2)
eje_x_3 = p3+Tf(1:3,1)
eje_y_3 = p3+Tf(1:3,2)
line([p2(1) p3(1)],[p2(2) p3(2)],[p2(3) p3(3)],'color',[0 0 0],'linewidth',3)
line([p2(1) eje_x_2(1)],[p2(2) eje_x_2(2)],[p2(3) eje_x_2(3)],'color',[1 0 1],'linewidth',3)
line([p2(1) eje_y_2(1)],[p2(2) eje_y_2(2)],[p2(3) eje_y_2(3)],'color',[0.5 0 1],'linewidth',3)
line([p3(1) eje_x_3(1)],[p3(2) eje_x_3(2)],[p3(3) eje_x_3(3)],'color',[1 0 1],'linewidth',3)
line([p3(1) eje_y_3(1)],[p3(2) eje_y_3(2)],[p3(3) eje_y_3(3)],'color',[0.5 0 1],'linewidth',3)
    
pause (0.1)
grid on
end