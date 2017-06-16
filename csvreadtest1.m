      voltage = csvread('square1_05Vpp - red.csv');
plot(voltage(:,1),voltage(:,2))
figure

% N = csvread('2_Act_44_6cm_no_damping.csv',0, 0,[0 0 300000 1]) / 1000;
% M = csvread('2Act_6Pulse_damping_on.csv',61000, 0,[61000 0 85000 1]) / 1000;
% plot(N(:,1),N(:,2))
% figure
% plot(M(:,1)-61000/1000,M(:,2))

%% Mech Relay with Bigger Actuator
% N = csvread('mech_relay_old_actuator_NO_DAMP_10.0ms_111716.csv',0, 0,[0 0 3800 1]) / 1000;
% % N = csvread('mech_relay_old_actuator_10ms_111716.csv',0, 0,[0 0 3800 1]) / 1000;
% plot(N(:,1),N(:,2))
% % figure
% % plot(M(:,1)-61000/1000,M(:,2))