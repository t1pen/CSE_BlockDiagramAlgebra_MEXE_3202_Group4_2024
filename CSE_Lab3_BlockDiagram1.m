%% Laboratory 3 No. 1 - Block Diagram Algebra

% Clear
clear
clc
close all


%% Define G1, G2, G3, H1, H2 and H3

% G1(s) = 1/s^2
G1_num = 1;
G1_den = [1 0 0];
G1 = tf(G1_num,G1_den)

% G2(s) = 1/(s+1)
G2_num = 1;
G2_den = [1 1];
G2 = tf(G2_num,G2_den)

% G3(s) = 1/s
G3_num = 1 ;
G3_den = [1 0];
G3 = tf(G3_num,G3_den)

% H1(s) = 1/s
H1_num = 1;
H1_den = [1 0];
H1 = tf(H1_num,H1_den)

% H2(s) = 1/(s-1)
H2_num = 1;
H2_den = [1 -1];
H2 = tf(H2_num,H2_den)

% H3(s) = 1/(s-2)
H3_num = 1;
H3_den = [1 -2];
H3 = tf(H3_num,H3_den)


%% Reduce Block Diagrams

G3H3_num = conv(G3_num,H3_num);
G3H3_den = conv(G3_den,H3_den);
G3H3 = tf(G3H3_num, G3H3_den)

TF1_den_add = G3H3_den + G3H3_num

TF1_num = conv(G3_num, G3H3_den);
TF1_den = conv(G3_den, TF1_den_add);
TF1 = tf(TF1_num,TF1_den)

TF2 = [1 2]

G2H2_num = conv(G2_num, H2_num)
G2H2_den = conv(G2_den, H2_den)

TF3_den_add = [1 0 0]

TF3_num = conv(G2_num, G2H2_den);
TF3_den = conv(G2_den, TF3_den_add)
TF3 = tf(TF3_num, TF3_den)

TF4_num = conv(TF3_num, G1_num);
TF4_den = conv(TF3_den, G1_den);
TF4 = tf(TF4_num, TF4_den)

TF5_num = conv(TF2, TF1_num);
TF5_den = TF1_den;
TF5 = tf(TF5_num, TF5_den)

G1G2H2_num = conv(TF4_num,H1_num);
G1G2H2_den = conv(TF4_den,H1_den);
G1G2H2 = tf(G1G2H2_num, G1G2H2_den)

TF6_den_add = [1 0 0 0 1 -1];
TF6_num = conv(TF4_num, G1G2H2_den);
TF6_den = conv(TF4_den, TF6_den_add);
TF6 = tf(TF6_num, TF6_den)
minreal(TF6)

TF7_num = conv(TF5_num, TF6_num);
TF7_den = conv(TF5_den, TF6_den)
TF7 = tf(TF7_num, TF7_den)


%% Step Response
step(TF7,0:0.1:10)