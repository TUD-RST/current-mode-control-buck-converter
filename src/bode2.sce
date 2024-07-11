// Current-Mode Control of a Distributed Buck Converter with a Lossy Transmission Line
// Klaus Röbenack and Daniel Gerbet, 2024
//
// Frequency response of the conventional converter with and without PI controller

// angular frequencies
N=100000;
W=logspace(3,9,N);
W=W(:);

// amplitude and phase values
F=zeros(N,2);
P=zeros(N,2);

// scale rad to deg
rad2deg=180/%pi;

// integration time constant (PI controller))
Ti=1E-5; 

for k=1:N,
    s=%i*W(k);
    // conventional converter without controller
    Pk=(8298755.186721992*s + 829377891946.9895)/(1.0*s^2 + 265915.1397140521*s + 707735801119.8038);
    // conventional converter with controller
    Pol=Pk*(1+s*Ti)/(s*Ti);
    // amplitue values in dB
    F(k,1)=20*log10(abs(Pk));
    F(k,2)=20*log10(abs(Pol));
    // phase in deg
    P(k,1)=rad2deg*angle(Pk);
    P(k,2)=rad2deg*angle(Pol);
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
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
xgrid();
legend("$\text{converter without controller}$","$\text{converter with PI controller}$",1);

subplot(2,1,2);
plot2d("ln",W,P);
xlabel("$\text{Angular frequency $\omega$ in rad/s}$");
ylabel("$\text{Phase in deg}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
xgrid();
legend("$\text{converter without controller}$","$\text{converter with PI controller}$",1);

gcf().figure_size=[1000 1200];
xs2png(gcf(),"bode2");
xs2svg(gcf(),"bode2");
