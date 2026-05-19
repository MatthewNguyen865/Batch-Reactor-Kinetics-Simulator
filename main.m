% Parameters
k = 0.5;
C0 = 1;
tspan = [0, 10];

% Solve ODE
[t, C] = ode45(@(t, C) batch_ode(t, C, k), tspan, C0);
X = (C0 - C)/C0;

% Plot results
plot_results(t, C, C0, k);