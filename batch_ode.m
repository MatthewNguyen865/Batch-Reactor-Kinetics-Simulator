function dCdt = batch_ode(~, C, k)

% First-order batch reactor
% Reaction: A -> Products
% Rate law: r = -kC
% Differential equation: dC/dt = -kC

dCdt = -k * C;

end