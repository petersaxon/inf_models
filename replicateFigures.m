clear all
close all

% replicates figures from the paper
% Ternent, Lucy, et al. "Bacterial fitness shapes the population dynamics of antibiotic-resistant and-susceptible bacteria in a model of combined antibiotic and anti-virulence treatment." Journal of theoretical biology 372 (2015): 1-11.


% figure 2a
p=genParameters(); tspan=[0 8];
odefun=@(t,x) model(t,x,p);
x0=[0,0,0,6000,20]';
[t,x] = ode15s(odefun,tspan,x0);
figure; plot(t,x(:,[4,5,3]))
title('figure 2a: no treatment'); legend({'S','R','P'});
print('fig2a','-dpng')

% figure 2b
p=genParameters(); tspan=[0 8];
odefun=@(t,x) model(t,x,p);
x0=[4,0,0,6000,20]';
[t,x] = ode15s(odefun,tspan,x0);
figure; plot(t,x(:,[4,5,3]))
title('figure 2b: one dose antibiotic'); legend({'S','R','P'});
print('fig2b','-dpng')

% figure 2c
p=genParameters(); tspan=[0:10]/2;
odefun=@(t,x) model(t,x,p);
x=[0,0,0,6000,20]; t=[0];
for i=2:numel(tspan)
    x0=x(end,:);
    x0(1) = x0(1)+4; % add dose at points defined by tspan
    [tPart,xPart] = ode15s(odefun,tspan(i-1:i),x0);
    x=[x;xPart];
    t=[t;tPart];
end
figure; plot(t,x(:,[4,5,3]))
title('figure 2c: repeated dosing'); legend({'S','R','P'});
print('fig2c','-dpng')


% figure 2d
p=genParameters('alpha',0); tspan=[0 8];
odefun=@(t,x) model(t,x,p);
x0=[4,0,0,6000,20]';
[t,x] = ode15s(odefun,tspan,x0);
figure; plot(t,x(:,[4,5,3]))
title('figure 2d: constant antibiotic level'); legend({'S','R','P'});
print('fig2d','-dpng')