%% Laboratory 3 No. 2 - Block Diagram Algebra

% Clear
clear
clc
close all

%% Define G1, G2, G3, G4, H1, H2 and H3
% G(s) = 1/s^2
G1_num = [1];
G1_den = [1 0 0];
G1 = tf(G1_num,G1_den)

% G(s) = 1/(s+1)
G2_num = [1];
G2_den = [1 1];
G2 = tf(G2_num,G2_den)

% G(s) = 1/s
G3_num = [1];
G3_den = [1 0];
G3 = tf(G3_num,G3_den)

% G(s) = 1/2s
G4_num = [1];
G4_den = [2 0];
G4 = tf(G4_num,G4_den)

%H(s) = 1/s
H1_num = [1];
H1_den = [1 0];
H1 = tf(H1_num,H1_den)

%H(s) = 1/(s-1)
H2_num = [1];
H2_den = [1 -1];
H2 = tf(H2_num,H2_den)

%H(s) = 1/(s-2)
H3_num = [1];
H3_den = [1 -2];
H3 = tf(H3_num,H3_den)
%% Reduce Block Diagrams
sys1 = series (G3, G4)
sys2 = feedback (sys1, H3)
sys3 = series (G2, sys2)
sys4 = H2/G4
sys5 = feedback (sys3, sys4)
sys6 = series (G1, sys5)
sys7 = feedback (sys6, H1)

%% Step Response
step(sys7,0:0.1:20)
