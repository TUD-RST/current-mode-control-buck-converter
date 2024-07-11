// Current-Mode Control of a Distributed Buck Converter with a Lossy Transmission Line
// Klaus Röbenack and Daniel Gerbet, 2024
//
// Frequency response of the different converter models

// angular frequencies
N=100000;
W=logspace(3,9,N);
W=W(:);

// amplitude and phase values
F=zeros(N,4);
P=zeros(N,4);

// scale rad to deg
rad2deg=180/%pi;

for k=1:N,
    s=%i*W(k);
    // conventional converter
    Pk=(8298755.186721992*s + 829377891946.9895)/(1.0*s^2 + 265915.1397140521*s + 707735801119.8038);
    // distributed converter
    Pd=((0.000120000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15)*s + 12.0000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15))*cosh(6.00000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15)) + ((1.20000000000000e-8)*s + 2.40000000000000e-11)*sinh(6.00000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15)))/(((2.41000000000000e-12)*s^2 + (6.41000000000000e-7)*s + 0.0400000000000000)*sinh(6.00000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15)) + 10.0000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15)*cosh(6.00000000000000*sqrt((2.41000000000000e-17)*s^2 + (4.00000004820000e-12)*s + 8.00000000000000e-15)))
    // Padé approximant (0,1)
    P01=-121684.784841855/(s - 103837.683063803);
    // Padé approximant (1,2)
    P12=(8.30398290026456e6*s + 8.29900199309498e11)/(s^2 + 265983.502353863*s + 7.08181503402271e11);
    // amplitue values in dB
    F(k,1)=20*log10(abs(Pk));
    F(k,2)=20*log10(abs(Pd));
    F(k,3)=20*log10(abs(P01));
    F(k,4)=20*log10(abs(P12));
    // phase in deg
    P(k,1)=rad2deg*angle(Pk);
    P(k,2)=rad2deg*angle(Pd);
    P(k,3)=rad2deg*angle(P01);
    P(k,4)=rad2deg*angle(P12);
end;

clf();
subplot(2,1,1);
plot2d("ln",W,F);
xlabel("$\text{Angular frequency $\omega$ in rad/s}$");
ylabel("$\text{Amplitude response in dB}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).foreground=5;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
g.children(1).children(3).thickness=2;
g.children(1).children(4).thickness=2;
xgrid();
legend("$\text{standard converter}$","$\text{distributed converter}$","$\text{Padé approximant }(0,1)$","$\text{Padé approximant }(1,2)$",3);

subplot(2,1,2);
plot2d("ln",W,P);
xlabel("$\text{Angular frequency $\omega$ in rad/s}$");
ylabel("$\text{Phase in deg}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).foreground=5;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
g.children(1).children(3).thickness=2;
g.children(1).children(4).thickness=2;
xgrid();
legend("$\text{standard converter}$","$\text{distributed converter}$","$\text{Padé approximant }(0,1)$","$\text{Padé approximant }(1,2)$",3);


gcf().figure_size=[1000 1200];
xs2png(gcf(),"bode1");
xs2svg(gcf(),"bode1");
