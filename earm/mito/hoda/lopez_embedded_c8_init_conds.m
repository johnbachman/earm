function conc = lopez_embedded_c8_init_conds()

conc = zeros(41, 1);
conc(1) = 40000; % Bid_0; Bid(bf=None, state=U)
conc(2) = 1000; % Bad_0; Bad(bf=None, state=C)
conc(3) = 80000; % Bax_0; Bax(bf=None, s1=None, s2=None, state=C)
conc(4) = 20000; % Bak_0; Bak(bf=None, s1=None, s2=None, state=M)
conc(5) = 20000; % Bcl2_0; Bcl2(bf=None)
conc(6) = 20000; % BclxL_0; BclxL(bf=None, state=C)
conc(7) = 20000; % Mcl1_0; Mcl1(bf=None, state=M)
conc(8) = 1000; % Noxa_0; Noxa(bf=None, state=C)
conc(9) = 500000; % CytoC_0; CytoC(bf=None, state=M)
conc(10) = 100000; % Smac_0; Smac(bf=None, state=M)
conc(11) = 1; % C8_0; C8(state=A, bf=None)

end

