// Current-Mode Control of a Distributed Buck Converter with a Lossy Transmission Line
// Klaus Röbenack and Daniel Gerbet, 2024
//
// transiente Simulation, step response 

// load the blocks library and the simulation engine
loadXcosLibs(); loadScicos();

importXcosDiagram("sim-step.zcos");

typeof(scs_m); //The diagram data structure

scicos_simulate(scs_m);

fig=scf(10);
clf(fig);

clf();
subplot(1,2,1);
plot2d(A.time*1E+6,A.values(:,1:2));
xlabel("$\text{Time $t$ in $\mu$s}$");
ylabel("$\text{Currents in A}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
legend("$i(t)$","$i_1(t)$");
g.children(1).font_size=5;
xgrid();

subplot(1,2,2);
plot2d(A.time*1E+6,A.values(:,3:4));
xlabel("$\text{Time $t$ in $\mu$s}$");
ylabel("$\text{Voltages in V}$");
g=gca();
g.font_size=4;
g.x_label.font_size=5;
g.y_label.font_size=5;
g.children(1).children(1).thickness=2;
g.children(1).children(1).line_style=3;
g.children(1).children(2).thickness=2;
legend("$v(t)$","$v_N(t)$",4);
g.children(1).font_size=5;
xgrid();
g.data_bounds(2,2)=10;

// save graphics
gcf().figure_size=[1000 600];
xs2png(gcf(),"sim-step");
