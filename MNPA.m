clear
clc
close all

R = [1, 2, 10, 0.1, 1000];
CVals = 0.25;
LVal = 0.2;
alpha = 100;
omega = 0;

G = zeros(9);

%Row 1
G(1,1) = 1./R(1);
G(1,2) = -1./R(2);
G(1,3) = 1;

%Row 2
G(2,1) = -1./R(1);
G(2,2) = (1./R(1))+(1./R(2));
G(2,4) = 1;

%Row 3
G(3,4) = 1;
G(3,5) = -1./R(3);

%Row 4
G(4,4) = LVal.*1i.*omega;

%Row 5
G(5,6) = 1./R(4);
G(5,7) = 1;
G(5,8) = -1./R(5);

%Row 6
G(6,6) = 1;

%Row 7
G(7,6) = -1./R(4);
G(7,8) = 1./R(4)+1./R(5);

%Row 8
G(8,1) = 1;

G(9,9) = 1;

%C matrix
C = zeros(9);

%Row 1
C(1,1) = CVals;
C(1,2) = -CVals;

%Row 2
C(2,1) = -CVals;
C(2,2) = CVals;

%Row 4
C(4,2) = 1./LVal;
C(4,5) = -1./LVal;


%DC Case
Vspace = linspace(-10, 10, 100);
F = zeros(9,1);

omega = 0;

for i = 1:length(Vspace) 
    F(4) = F(2) - F(5);
    F(6) = alpha.*F(9);
    F(8) = Vspace(i);
    %F(9) = F(5)./R(3);
    V = G\F
end







