k = 0.5;
C0 = 1;
tspan = [0, 10];

[t, C] = ode45(@(t, C) -k * C, tspan, C0);
X = (C0 - C)/C0;

figure(1);
tiledlayout(3, 1);

nexttile;
plot(t, C);
xlabel("Time");
ylabel("Concentration");
title("Concentration in Batch Reactor");

nexttile;
plot(t, -k * C);
xlabel("Time");
ylabel("Rate of Change of Concentration");
title("Rate of Change of Concentration in Batch Reactor");

nexttile;
plot(t, X);
xlabel("Time");
ylabel("Conversion");
title("Conversion in Batch Reactor");

figure(2);
tiledlayout(2, 1);

C_analytical = C0 * exp(-k * t);

nexttile;
plot(t, C, 'b', t, C_analytical, 'r--')
xlabel("Time")
ylabel("Concentration")
title("Batch Reactor: Numerical vs Analytical Solution")
legend("ode45 solution", "Analytical solution")

error = abs(C - C_analytical);

nexttile;
semilogy(t, error)
xlabel("Time")
ylabel("Absolute Error")
title("Numerical Error (ode45 vs Analytical)")
