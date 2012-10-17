function out = lopez_embedded_c8_odes(t, input, param)

% input(1) = Bid(bf=None, state=U);
% input(2) = Bad(bf=None, state=C);
% input(3) = Bax(bf=None, input(2)=None, input(3)=None, state=C);
% input(4) = Bak(bf=None, input(2)=None, input(3)=None, state=M);
% input(5) = Bcl2(bf=None);
% input(6) = BclxL(bf=None, state=C);
% input(7) = Mcl1(bf=None, state=M);
% input(8) = Noxa(bf=None, state=C);
% input(9) = CytoC(bf=None, state=M);
% input(10) = Smac(bf=None, state=M);
% input(11) = C8(state=A, bf=None);
% input(12) = Bax(bf=None, input(2)=None, input(3)=None, state=M);
% input(13) = BclxL(bf=None, state=M);
% input(14) = Bid(bf=1, state=U) % C8(state=A, bf=1);
% input(15) = Bid(bf=None, state=T);
% input(16) = Bid(bf=None, state=M);
% input(17) = Bax(bf=1, input(2)=None, input(3)=None, state=M) % Bid(bf=1, state=M);
% input(18) = Bak(bf=1, input(2)=None, input(3)=None, state=M) % Bid(bf=1, state=M);
% input(19) = Bcl2(bf=1) % Bid(bf=1, state=M);
% input(20) = BclxL(bf=1, state=M) % Bid(bf=1, state=M);
% input(21) = Bid(bf=1, state=M) % Mcl1(bf=1, state=M);
% input(22) = Bax(bf=None, input(2)=None, input(3)=None, state=A);
% input(23) = Bak(bf=None, input(2)=None, input(3)=None, state=A);
% input(24) = Bax(bf=1, input(2)=None, input(3)=None, state=A) % Bax(bf=1, input(2)=None, input(3)=None, state=M);
% input(25) = Bak(bf=1, input(2)=None, input(3)=None, state=A) % Bak(bf=1, input(2)=None, input(3)=None, state=M);
% input(26) = Bax(bf=1, input(2)=None, input(3)=None, state=A) % Bcl2(bf=1);
% input(27) = Bax(bf=1, input(2)=None, input(3)=None, state=A) % BclxL(bf=1, state=M);
% input(28) = Bak(bf=1, input(2)=None, input(3)=None, state=A) % BclxL(bf=1, state=M);
% input(29) = Bak(bf=1, input(2)=None, input(3)=None, state=A) % Mcl1(bf=1, state=M);
% input(30) = Bax(bf=None, input(2)=1, input(3)=None, state=A) % Bax(bf=None, input(2)=None, input(3)=1, state=A);
% input(31) = Bak(bf=None, input(2)=1, input(3)=None, state=A) % Bak(bf=None, input(2)=None, input(3)=1, state=A);
% input(32) = Bax(bf=None, input(2)=1, input(3)=2, state=A) % Bax(bf=None, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=1, state=A);
% input(33) = Bak(bf=None, input(2)=1, input(3)=2, state=A) % Bak(bf=None, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=1, state=A);
% input(34) = Bax(bf=None, input(2)=1, input(3)=2, state=A) % Bax(bf=None, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=4, state=A) % Bax(bf=None, input(2)=4, input(3)=1, state=A);
% input(35) = Bak(bf=None, input(2)=1, input(3)=2, state=A) % Bak(bf=None, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=4, state=A) % Bak(bf=None, input(2)=4, input(3)=1, state=A);
% input(36) = Bax(bf=1, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=4, state=A) % Bax(bf=None, input(2)=4, input(3)=5, state=A) % Bax(bf=None, input(2)=5, input(3)=2, state=A) % CytoC(bf=1, state=M);
% input(37) = Bax(bf=1, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=4, state=A) % Bax(bf=None, input(2)=4, input(3)=5, state=A) % Bax(bf=None, input(2)=5, input(3)=2, state=A) % Smac(bf=1, state=M);
% input(38) = Bak(bf=1, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=4, state=A) % Bak(bf=None, input(2)=4, input(3)=5, state=A) % Bak(bf=None, input(2)=5, input(3)=2, state=A) % CytoC(bf=1, state=M);
% input(39) = Bak(bf=1, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=4, state=A) % Bak(bf=None, input(2)=4, input(3)=5, state=A) % Bak(bf=None, input(2)=5, input(3)=2, state=A) % Smac(bf=1, state=M);
% input(40) = CytoC(bf=None, state=C);
% input(41) = Smac(bf=None, state=C);

% Bid(bf=None, state=U)
out(1,1) = -param(74)*input(1)*input(11) + param(75)*input(14);
% Bad(bf=None, state=C)
out(2,1) = 0;
% Bax(bf=None, input(2)=None, input(3)=None, state=C)
out(3,1) = -param(13)*input(3) + param(14)*input(12);
% Bak(bf=None, input(2)=None, input(3)=None, state=M)
out(4,1) = -param(26)*input(23)*input(4) + param(27)*input(25) - param(20)*input(16)*input(4) + param(21)*input(18);
% Bcl2(bf=None)
out(5,1) = -param(35)*input(22)*input(5) + param(36)*input(26) - param(29)*input(16)*input(5) + param(30)*input(19);
% BclxL(bf=None, state=C)
out(6,1) = -param(15)*input(6) + param(16)*input(13);
% Mcl1(bf=None, state=M)
out(7,1) = -param(41)*input(23)*input(7) + param(42)*input(29) - param(33)*input(16)*input(7) + param(34)*input(21);
% Noxa(bf=None, state=C)
out(8,1) = 0;
% CytoC(bf=None, state=M)
out(9,1) = -param(67)*input(35)*input(9) + param(68)*input(38) - param(61)*input(34)*input(9) + param(62)*input(36);
% Smac(bf=None, state=M)
out(10,1) = -param(70)*input(35)*input(10) + param(71)*input(39) - param(64)*input(34)*input(10) + param(65)*input(37);
% C8(state=A, bf=None)
out(11,1) = -param(74)*input(1)*input(11) + param(75)*input(14) + param(76)*input(14);
% Bax(bf=None, input(2)=None, input(3)=None, state=M)
out(12,1) = -param(23)*input(12)*input(22) + param(24)*input(24) - param(17)*input(12)*input(16) + param(18)*input(17) + param(13)*input(3) - param(14)*input(12);
% BclxL(bf=None, state=M)
out(13,1) = -param(39)*input(13)*input(23) + param(40)*input(28) - param(37)*input(13)*input(22) + param(38)*input(27) - param(31)*input(13)*input(16) + param(32)*input(20) + param(15)*input(6) - param(16)*input(13);
% Bid(bf=1, state=U) % C8(state=A, bf=1)
out(14,1) = param(74)*input(1)*input(11) - param(75)*input(14) - param(76)*input(14);
% Bid(bf=None, state=T)
out(15,1) = param(76)*input(14) - param(11)*input(15) + param(12)*input(16);
% Bid(bf=None, state=M)
out(16,1) = -param(20)*input(16)*input(4) + param(21)*input(18) - param(17)*input(12)*input(16) + param(18)*input(17) - param(29)*input(16)*input(5) + param(30)*input(19) - param(31)*input(13)*input(16) + param(32)*input(20) - param(33)*input(16)*input(7) + param(34)*input(21) + param(22)*input(18) + param(19)*input(17) + param(11)*input(15) - param(12)*input(16);
% Bax(bf=1, input(2)=None, input(3)=None, state=M) % Bid(bf=1, state=M)
out(17,1) = param(17)*input(12)*input(16) - param(18)*input(17) - param(19)*input(17);
% Bak(bf=1, input(2)=None, input(3)=None, state=M) % Bid(bf=1, state=M)
out(18,1) = param(20)*input(16)*input(4) - param(21)*input(18) - param(22)*input(18);
% Bcl2(bf=1) % Bid(bf=1, state=M)
out(19,1) = param(29)*input(16)*input(5) - param(30)*input(19);
% BclxL(bf=1, state=M) % Bid(bf=1, state=M)
out(20,1) = param(31)*input(13)*input(16) - param(32)*input(20);
% Bid(bf=1, state=M) % Mcl1(bf=1, state=M)
out(21,1) = param(33)*input(16)*input(7) - param(34)*input(21);
% Bax(bf=None, input(2)=None, input(3)=None, state=A)
out(22,1) = -2*param(49)*power(input(22), 2) + 2*param(50)*input(30) - param(51)*input(22)*input(30) + param(52)*input(32) - param(53)*input(22)*input(32) + param(54)*input(34) - param(23)*input(12)*input(22) + param(24)*input(24) - param(35)*input(22)*input(5) + param(36)*input(26) - param(37)*input(13)*input(22) + param(38)*input(27) + 2*param(25)*input(24) + param(19)*input(17);
% Bak(bf=None, input(2)=None, input(3)=None, state=A)
out(23,1) = -2*param(55)*power(input(23), 2) + 2*param(56)*input(31) - param(57)*input(23)*input(31) + param(58)*input(33) - param(59)*input(23)*input(33) + param(60)*input(35) - param(26)*input(23)*input(4) + param(27)*input(25) - param(39)*input(13)*input(23) + param(40)*input(28) - param(41)*input(23)*input(7) + param(42)*input(29) + 2*param(28)*input(25) + param(22)*input(18);
% Bax(bf=1, input(2)=None, input(3)=None, state=A) % Bax(bf=1, input(2)=None, input(3)=None, state=M)
out(24,1) = param(23)*input(12)*input(22) - param(24)*input(24) - param(25)*input(24);
% Bak(bf=1, input(2)=None, input(3)=None, state=A) % Bak(bf=1, input(2)=None, input(3)=None, state=M)
out(25,1) = param(26)*input(23)*input(4) - param(27)*input(25) - param(28)*input(25);
% Bax(bf=1, input(2)=None, input(3)=None, state=A) % Bcl2(bf=1)
out(26,1) = param(35)*input(22)*input(5) - param(36)*input(26);
% Bax(bf=1, input(2)=None, input(3)=None, state=A) % BclxL(bf=1, state=M)
out(27,1) = param(37)*input(13)*input(22) - param(38)*input(27);
% Bak(bf=1, input(2)=None, input(3)=None, state=A) % BclxL(bf=1, state=M)
out(28,1) = param(39)*input(13)*input(23) - param(40)*input(28);
% Bak(bf=1, input(2)=None, input(3)=None, state=A) % Mcl1(bf=1, state=M)
out(29,1) = param(41)*input(23)*input(7) - param(42)*input(29);
% Bax(bf=None, input(2)=1, input(3)=None, state=A) % Bax(bf=None, input(2)=None, input(3)=1, state=A)
out(30,1) = param(49)*power(input(22), 2) - param(50)*input(30) - param(51)*input(22)*input(30) + param(52)*input(32);
% Bak(bf=None, input(2)=1, input(3)=None, state=A) % Bak(bf=None, input(2)=None, input(3)=1, state=A)
out(31,1) = param(55)*power(input(23), 2) - param(56)*input(31) - param(57)*input(23)*input(31) + param(58)*input(33);
% Bax(bf=None, input(2)=1, input(3)=2, state=A) % Bax(bf=None, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=1, state=A)
out(32,1) = param(51)*input(22)*input(30) - param(52)*input(32) - param(53)*input(22)*input(32) + param(54)*input(34);
% Bak(bf=None, input(2)=1, input(3)=2, state=A) % Bak(bf=None, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=1, state=A)
out(33,1) = param(57)*input(23)*input(31) - param(58)*input(33) - param(59)*input(23)*input(33) + param(60)*input(35);
% Bax(bf=None, input(2)=1, input(3)=2, state=A) % Bax(bf=None, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=4, state=A) % Bax(bf=None, input(2)=4, input(3)=1, state=A)
out(34,1) = param(53)*input(22)*input(32) - param(54)*input(34) - param(61)*input(34)*input(9) + param(62)*input(36) - param(64)*input(34)*input(10) + param(65)*input(37) + param(63)*input(36) + param(66)*input(37);
% Bak(bf=None, input(2)=1, input(3)=2, state=A) % Bak(bf=None, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=4, state=A) % Bak(bf=None, input(2)=4, input(3)=1, state=A)
out(35,1) = param(59)*input(23)*input(33) - param(60)*input(35) - param(67)*input(35)*input(9) + param(68)*input(38) - param(70)*input(35)*input(10) + param(71)*input(39) + param(69)*input(38) + param(72)*input(39);
% Bax(bf=1, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=4, state=A) % Bax(bf=None, input(2)=4, input(3)=5, state=A) % Bax(bf=None, input(2)=5, input(3)=2, state=A) % CytoC(bf=1, state=M)
out(36,1) = param(61)*input(34)*input(9) - param(62)*input(36) - param(63)*input(36);
% Bax(bf=1, input(2)=2, input(3)=3, state=A) % Bax(bf=None, input(2)=3, input(3)=4, state=A) % Bax(bf=None, input(2)=4, input(3)=5, state=A) % Bax(bf=None, input(2)=5, input(3)=2, state=A) % Smac(bf=1, state=M)
out(37,1) = param(64)*input(34)*input(10) - param(65)*input(37) - param(66)*input(37);
% Bak(bf=1, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=4, state=A) % Bak(bf=None, input(2)=4, input(3)=5, state=A) % Bak(bf=None, input(2)=5, input(3)=2, state=A) % CytoC(bf=1, state=M)
out(38,1) = param(67)*input(35)*input(9) - param(68)*input(38) - param(69)*input(38);
% Bak(bf=1, input(2)=2, input(3)=3, state=A) % Bak(bf=None, input(2)=3, input(3)=4, state=A) % Bak(bf=None, input(2)=4, input(3)=5, state=A) % Bak(bf=None, input(2)=5, input(3)=2, state=A) % Smac(bf=1, state=M)
out(39,1) = param(70)*input(35)*input(10) - param(71)*input(39) - param(72)*input(39);
% CytoC(bf=None, state=C)
out(40,1) = param(69)*input(38) + param(63)*input(36);
% Smac(bf=None, state=C)
out(41,1) = param(72)*input(39) + param(66)*input(37);

end
