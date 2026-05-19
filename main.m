%% Simulation Parameters
k = input("Enter reaction rate constant k (default 0.5): "); % reaction rate constant (1/s)
if isempty(k)
    k = 0.5;
end
C0 = input("Enter initial concentration C0 (default 1): "); % initial concentration (mol/L)
if isempty(C0)
    C0 = 1;
end
t_final = input("Enter final simulation time (default 10): "); % final simulation time (s)
if isempty(t_final)
    t_final = 10;
end

tspan = [0 t_final];

%% Solve ODE
[t, C] = ode45(@(t, C) batch_ode(t, C, k), tspan, C0);

%% Plot results
plot_results(t, C, C0, k);