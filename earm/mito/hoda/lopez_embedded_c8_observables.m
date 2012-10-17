function [ode_observables, kd_values, kd_index, ic_index, dividing_factor] = lopez_embedded_c8_observables()

ode_observables{1, 1} = [12 17 24]; % Observable('mBid', Bax(state=M))
ode_observables{1, 2} = [1 1 1];
ode_observables{1, 3} = 1;
ode_observables{2, 1} = [22 24 26 27 30 32 34 36 37]; % Observable('aBax', Bax(state=A))
ode_observables{2, 2} = [1 1 1 1 2 3 4 4 4];
ode_observables{2, 3} = 1;
ode_observables{3, 1} = [41]; % Observable('cSmac', Smac(state=C))
ode_observables{3, 2} = [1];
ode_observables{3, 3} = 1;
end
