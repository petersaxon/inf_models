function [ dx ] = model( t,x,p)
% Model of population dynamics of antibiotic resistant and susceptible
% bacteria during combined antibiotic and antivirulence therapy.
%
% For further info see
% Ternent, Lucy, et al. "Bacterial fitness shapes the population dynamics of antibiotic-resistant and-susceptible bacteria in a model of combined antibiotic and anti-virulence treatment." Journal of theoretical biology 372 (2015): 1-11.
%
%
% 1: A - antibiotic drug
% 2: As - anti virulence drug
% 3: P - immune cells
% 4: S - susceptible bacteria
% 5: R - resistant bacteria
%
% required parameters are described in genParameters.m


dx=zeros(5,1);

dx(1) = - p.alpha * x(1);
dx(2) = - p.kappa * x(2);
dx(3) =   p.beta * (x(4)+x(5)) * (1 - x(3)/p.Pmax) ...
        - p.delta * (x(4)+x(5)) * x(3) ...
        - p.deltaP * x(3);

if x(4)>=1
    dx(4) = p.etaS * x(4) * (1- (x(4)+x(5))/ p.K) ...
            - p.muS(x(1)) * x(4) ...
            - (p.gamma + p.zeta(x(2))) * x(3) * x(4) ...
            - p.lambda * x(4) * x(5)...
            + p.rho * x(5) ...
            - p.omega * x(4);
else
    dx(4) =  - p.omega * x(4);
end

if x(5)>=1
    dx(5) = (1-p.c) * p.etaS * x(5) * (1- (x(4)+x(5)) / p.K) ...
             - p.muR(x(1)) * x(5) ...
             - (p.gamma + p.zeta(x(2))) * x(3) * x(5) ...
             - p.lambda * x(4) * x(5)...
             + p.rho * x(5) ...
             - p.omega * x(5);
else
    dx(5) = - p.omega * x(5);
end




end

