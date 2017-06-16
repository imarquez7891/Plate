function Copy_of_RibbonExcite(y)
dbstop if error
%% Ribbon Structure
Ribbon=[];
Ribbon.Actuator.y   = [25 -100]*1e-3; % m, position of actuators
Ribbon.v            = 26;             % m/s, velocity of waves

%% test location
P          = y * 1e-3;                % P, desired impulse location
sf         = 25000;                     % samples / s (25k)

%% Defined signal shape
PulseWidth = 0.1;                          % seconds
dn      = floor(PulseWidth*sf);            % sample size

a = [];

filename = 'square0_2Vpp.csv';            % specify file 
h = csvread(filename);                     % read file data
voltage = h(:,2)*2.75;                          % specify input signal voltage
Pulse = voltage;

n_c = 16; % Define how many # of channels you want to fire
Pulses = zeros(length(Pulse),n_c);

for i = 1:n_c
    Pulses(:,i) = Pulse;
end
% for t = 0:1/dn:(2*pi)*PulseWidth
%    a = [a; square((1/PulseWidth)*t)];
% end
% 
% psize = max(size(a));
% Pulse      = a.*ones(psize,1);          % actual pulse

%% Compute each delayed signal for each actuator position
%Pulses     = Copy_of_RibbonBuildSignals(Ribbon, P, Pulse, sf);
t          = (0:size(Pulses,1)-1)/sf;

% find a way to count number of clicks

figure(1);
plot(t, Pulses)
xlabel('Time (seconds)')
ylabel('Voltage (volts)')
title('DAQ Output');

%% Generate Signals on NI devices that Output Voltage
%
% This example shows how to generate data using a National Instruments
% device available to MATLAB(R) using the Session based interface.

% Copyright 2010-2014 The MathWorks, Inc.

%% Discover Devices that can Output Voltage 
% To discover a device that supports analog output voltage subsystems,
% click the name of the device in the list in the Command window, or access
% the device in the array returned by |daq.getDevices| command. This
% example uses a National Instruments CompactDAQ device NI 9263 with ID
% 'cDAQ1Mod2' representing the module in slot 2 of Chassis 'cDAQ1'.
devices = daq.getDevices;

%%
devices(1);

%% Create a Session
% Use the |daq.createSession| function to create a session 
% associated with a vendor.
% The session contains information describing the hardware, scan rate, 
% duration, and other properties associated with the generation.  
% When you create a session, assign it to a variable.

s = daq.createSession('ni')

%% Add Analog Output Channels 
% Use the |addAnalogOutputChannel| function to add two analog output 
% channels from this device to the session.

addAnalogOutputChannel(s,'cDAQ1Mod1',0:15,'Voltage');


%% Set the Session Rate
% By default the session is configured for 1000 scans/second. 
s.Rate = sf;

%% Generate a Single Scan
% Use the |outputSingleScan| function to generate a single scan. The data  
% is a 1-by-N matrix where N co rresponds to the number of output channels.
% Here you output 2V on each channel.

%data = [Pulses, n_c];
queueOutputData(s,Pulses);

s.startForeground;
end