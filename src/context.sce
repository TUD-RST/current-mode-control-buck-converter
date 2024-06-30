// Parameters and constants for the buck converter 
// (w) 2024 by Klaus Röbenack
// general parameters
E    = 12;      // 12 V supply coltage
R    = 10;      // 10 Ω load resistance
Cext = 1E-6;  // 1 µF 
// primary line constants
Lp  = 241E-9;   // 241 nF/m  
Cp  = 100E-12;  // 100 pF/m
RLp =  40E-3;   //  40 mΩ/m
GCp = 0.2E-12;  // 0.2 pS/m
// parameters of the whole transmission line
l=6;            // 6 m length of transmission line
Lbar  = l*Lp;
Cbar  = l*Cp;
RLbar = l*RLp;
GCbar = l*GCp;
// parameters of the standard buck converter
L  = Lbar;
C  = Cbar+Cext;
RL = RLbar;
GC = GCbar;
// PWM setup
wpwm=5E7;
fpwm=wpwm/(2*%pi);
Tpwm=1/fpwm;
// matrices of the conventional converter
AF=[-RL/L -1/L;1/C -(1+R*GC)/(R*C)];
BF=[E/L, 0]';
CF=eye(2,2);
DF=zeros(2,1);
// discretization of the distributed converter
N   = 25;
dL  = Lbar/N;
dC  = Cbar/N;
dRL = RLbar/N;
dGC = GCbar/N;
AL=zeros(2*N,2*N);
BL=zeros(2*N,1);
CL=zeros(2,2*N);
DL=zeros(2,1);
x0l=zeros(2*N,1);
for i=1:N,
    AL(i,i)=-dRL/dL;
    AL(i,i+N)=-1/dL;
end;
for i=2:N,
    AL(i,i+N-1)=1/dL;
end;
for i=1:N-1,
    AL(i+N,i)=1/dC;
    AL(i+N,i+N)=-dGC/dC;
end;
for i=2:N,
    AL(i+N-1,i)=-1/dC;
end;
AL(2*N,N)=1/(dC+Cext);
AL(2*N,2*N)=-(dGC+(1/R))/(dC+Cext);
BL(1,1)=E/dL;
CL(1,1)=1;      // i_1 = i(0,t)
CL(2,2*N)=1;    // u_N = u(l,t)
// prefilter
Vui=((GC*R+1)*((GC*R+1)*RL+R))/(R*(GC*R*RL+RL+R));
Vud=((GC*R+1)*RL+R)/(E*R);
// PI controller
Ti=1E-5;
k=5;
kp=k;
ki=k/Ti;
