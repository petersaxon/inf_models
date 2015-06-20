function [ p ] = genParameters( varargin )
% For further info see
% Ternent, Lucy, et al. "Bacterial fitness shapes the population dynamics of antibiotic-resistant and-susceptible bacteria in a model of combined antibiotic and anti-virulence treatment." Journal of theoretical biology 372 (2015): 1-11.
%
%
% to use, call with name/value pairs ie
% p = genParameters(); % all defaults used
% p = genParameters('beta',6,'c',0.4); % all defaults used except beta=6 and c=0.4;


% DEFAULTS.
% elimination rate of antibiotic
p.alpha  = 3.6;
% elimination rate of anti-virulence drug
p.kappa = 3.6;
% recruitment rate of phagocytes
p.beta = 3;
% maximum number of phagocytes
p.Pmax = 1.8e5;
% bacterial induced phagocyte death
p.delta = 6e-6;
% clearance rates of phagocytes
p.deltaP = 1.512;
% growth rate of susceptible bacteria
p.etaS = 24;
% carrying capacity of bacteria
p.K = 1e9;
% bacterial clearance by phagocytes
p.gamma  = 2.4e-4;
% conjugation rate constanct
p.lambda = 1e-5;
% reversion rate constant
p.rho = 1e-6;
% removal rate
p.omega = 0.7;
% fitness cost of resistance
p.c = 0.1;
% max killing rate of susceptible bacteria
p.EmaxS = 36;
% antibiotic conc for half max effect on susceptible bacteria
p.A50S = 0.25;
% max killing rate of resistant bacteria
p.EmaxR = 26.4;
% antibiotic conc for half max effect on resistant bacteria
p.A50R = 5;
% maximum increased effectiveness of immune response
p.gammamax = 0.035;
% anti-virulence drug concentration for half maximum effect
p.gamma50 = 5;
p.muS  = @(y) p.EmaxS*y/(y+p.A50S);
p.muR  = @(y) p.EmaxR*y/(y+p.A50R);
p.zeta = @(y) p.gammamax*y/(p.gamma50+y);


optionNames = fieldnames(p);
for pair = reshape(varargin,2,[])
    
   if any(strcmp(pair{1},optionNames))
       p.(pair{1}) = pair{2};
   else
      error('%s is not a recognized parameter',pair{1})
   end
end



end

