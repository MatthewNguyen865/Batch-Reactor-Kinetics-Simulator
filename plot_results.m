function plot_results(t, C, C0, k)

if ~exist('example_plots','dir')
    mkdir('example_plots')
end

set(groot,'defaultLineLineWidth',1.5);
X = (C0 - C)/C0;

figure("Name", "Batch Reactor Simulator", "NumberTitle", "off", "Position", [100, 100, 800, 600]); 
tile = tiledlayout(3, 1);
tile.TileSpacing = 'compact';
tile.Padding = 'compact';

nexttile;
plot(t, C);
grid on;
set(gca,'FontSize',12);
box on;
xlabel("Time");
ylabel("Concentration");
title("Concentration in Batch Reactor");

nexttile;
plot(t, -k * C);
grid on;
set(gca,'FontSize',12);
box on;
xlabel("Time");
ylabel("Rate of Change of Concentration");
title("Rate of Change of Concentration in Batch Reactor");

nexttile;
plot(t, X);
grid on;
set(gca,'FontSize',12);
box on;
xlabel("Time");
ylabel("Conversion");
title("Conversion in Batch Reactor");

if ~exist('batch_reactor_simulator.png','file')
    exportgraphics(gcf,'example_plots/batch_reactor_simulator.png','Resolution',300);
end

figure("Name", "Numerical vs Analytical Solution", "NumberTitle", "off");
tiledlayout(2, 1);

C_analytical = C0 * exp(-k * t);

nexttile;
plot(t, C, 'b', t, C_analytical, 'r--');
xlabel("Time");
ylabel("Concentration");
title("Batch Reactor: Numerical vs Analytical Solution");
legend("ode45 solution", "Analytical solution");

error = abs(C - C_analytical);

nexttile;
semilogy(t, error);
xlabel("Time");
ylabel("Absolute Error");
title("Numerical Error (ode45 vs Analytical)");

if ~exist('example_plots/numerical_vs_analytical.png','file')
    exportgraphics(gcf,'example_plots/numerical_vs_analytical.png','Resolution',300);
end

%% Sensitivity Analysis: Varying k

figure("Name", "Varying k", "NumberTitle", "off");

k_values = [0.2, 0.5, 1.0];
tspan = [0 10];

hold on;

for i = 1:length(k_values)
    k = k_values(i);
    [t, C] = ode45(@(t,C) batch_ode(t, C, k), tspan, C0);
    plot(t, C/C0, 'DisplayName', ['k = ' num2str(k)]);
end

xlabel("Time");
ylabel("Normalized Concentration");
title("Sensitivity of Reaction Rate Constant on Reactor Behavior");
legend;
hold off;

if ~exist('example_plots/varying_k.png','file')
    exportgraphics(gcf,'example_plots/varying_k.png','Resolution',300);
end

end