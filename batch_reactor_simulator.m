k = 0.5;
C0 = 1;
tspan = [0, 10];

[t, C] = ode45(@(t, C) -k * C, tspan, C0);

plot(t, C);
xlabel("Time");
ylabel("Concentration");