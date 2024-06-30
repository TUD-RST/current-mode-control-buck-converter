// Current-Mode Control of a Distributed Buck Converter with a Lossy Transmission Line
// Klaus Röbenack and Daniel Gerbet, 2024
//
// transiente Simulation with PWM excitation

// load the blocks library and the simulation engine
loadXcosLibs(); loadScicos();

importXcosDiagram("sim-pwm.zcos");

exec("context.sce");

typeof(scs_m) //The diagram data structure

//This diagram uses 3 context variables :
//  Amplitude : the sin function amplitude
//  Pulsation : the sin function pulsation
//  Tf        : the final simulation time

// PWM frequencies in MHz
F=[2 6 10];
n=length(F);

fig=scf(10);
clf(fig);

for k=1:n,
// setup for PWM 
fpwm=1E6*F(k);
Tpwm=1/fpwm;
scs_m.props.context; //the embedded definition
scs_m.props.context(2)="Tpwm="+sprintf("%e",Tpwm);

//first batch simulation with the parameters embedded in the diagram
scf(0);
scicos_simulate(scs_m);

scf(fig);
subplot(n,1,k);
xtitle(msprintf("$f_{\\text{PWM}} = %5.3f\\,\\text{MHz}$",1E-6*fpwm));
g=gca();
g.title.font_size=5;

subplot(n,2,2*k-1);
plot2d(A.time*1E+6,A.values(:,1:2));
if k==n,
    xlabel("$\text{Time $t$ in $\mu$s}$");
end;
ylabel("$\text{Currents in A}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.title.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
legend("$i(t)$","$i_1(t)$");
g.children(1).font_size=4;
xgrid();
g.data_bounds(1,2)=-4;
g.data_bounds(2,2)=+6;
// plot y axis
myy=tlist(["ticks", "locations", "labels"]);
yrg=(-4:2:6)';
myy.locations=yrg;
myy.labels=string(yrg);
g.y_ticks=myy;

scf(fig);
subplot(n,2,2*k);
plot2d(A.time*1E+6,A.values(:,3:4));
if k==n,
    xlabel("$\text{Time $t$ in $\mu$s}$");
end;
ylabel("$\text{Voltages in V}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.title.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
legend("$v(t)$","$v_N(t)$",4);
g.children(1).font_size=4;
xgrid();
myy=tlist(["ticks", "locations", "labels"]);
// plot y axis
yrg=(0:2:10)';
myy.locations=yrg;
myy.labels=string(yrg);
g.y_ticks=myy;

end;

// save graphics
scf(fig);
gcf().figure_size=[1000 1200];
xs2png(gcf(),"sim-pwm");
