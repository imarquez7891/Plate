clc,clear;
go = true;

%start loop
while go
%create daq module
s = daq.createSession('ni');
%set channel analog output
addAnalogOutputChannel(s,'cDAQ1mod1',0,'Voltage');

%set data
data1 = [0;
        6;
        0;];
    
%add small delay for stronger pulse

%output the data
queueOutputData(s, data1);
startForeground(s);

    if data1(2) == 6
        data1 = [0; 0; 0];
        pause(1);
    end
end
