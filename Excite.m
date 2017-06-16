function [] = Excite(x_chosen, y_chosen)
%% Plate structure
Plate = [];
% Plate.D           = 500e-3; % m, diameter WILD GUESS!
% Plate.Actuator.D1 = 460e-3; % m, diameter WILD GUESS!
% Plate.Actuator.D2 = 420e-3; % m, diameter WILD GUESS!
Plate.v           = 43; %m/s, wave propagation velocity
Plate.Actuator.x  = [0    34  65 90 113 126 131 126 112  90   63   32   -3  -38 -68  -92 -114 -127 -130 -124 -110 -90 -62 -32]*1e-3;
Plate.Actuator.y  = [130 125 112 91  63  31  -3 -34 -70 -92 -114 -127 -130 -124 -110 -90  -62  -28    3   36   67  94 115 126]*1e-3;

ActuatorList = 1:3:24;

Plate.Actuator.x = Plate.Actuator.x(ActuatorList); 
Plate.Actuator.y = Plate.Actuator.y(ActuatorList); 

Plate.Actuators = length(Plate.Actuator.x); % number of actuators used


%% test location
P = [0,0] * 1e-3; %m
sf = 25000; % samples/s

%% Define signal shape 
filename = 'square1_05Vpp.csv';            % specify file 
h = csvread(filename);                     % read file data
voltage = h(:,2);                          % specify input signal voltage
Pulse = voltage;

%% Compute each delayed signal for each actuator position
Pulses = Copy_of_PlateBuildSignals(Plate, P, Pulse, sf);
t       = (0:size(Pulses,1)-1)/sf;
% plot_control_signals(t, Pulses);
% hold off
% close all


% PlatePlotActuatorPosition(Plate)
 

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
devices(1)

%% Create a Session
% Use the |daq.createSession| function to create a session 
% associated with a vendor.
% The session contains information describing the hardware, scan rate, 
% duration, and other properties associated with the generation.  
% When you create a session, assign it to a variable.

s = daq.createSession('ni');

%% Add Analog Output Channels 
% Use the |addAnalogOutputChannel| function to add two analog output 
% channels from this device to the session.

addAnalogOutputChannel(s,'cDAQ1Mod1',0:15,'Voltage');  
%addAnalogOutputChannel(s,'cDAQ1Mod1',Plate.Actuators:15,'Voltage'); 

%% Set the Session Rate
% By default the session is configured for 1000 scans/second. 
s.Rate = sf;

%% Generate a Single Scan
% Use the |outputSingleScan| function to generate a single scan. The data  
% is a 1-by-N matrix where N corresponds to the number of output channels.
% Here you output 2V on each channel.

%outputSingleValue = 5*ones(1,Plate.Actuators');
%outputSingleScan(s, outputSingleValue*0);

queueOutputData(s,[5*Pulses 5*ones(length(Pulses),8)])

s.startForeground;

