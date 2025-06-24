clear all
close all

%% 1 hidden layer with 10 neurons

% Load the .mat files
load('AB.mat');     % This loads the AB matrix (70x2)     - Alpha and Beta from DE
%load('MEDIAN.mat'); % This loads the MEDIAN matrix (70x4)
load('MEAN.mat'); % This loads the MEDIAN matrix (70x10)

% Separate the data
inputs = MEAN;   % The input data 
outputs = AB;      % The target output data (70x2)

netconf = [10]; % 10 neurons
%netconf = [40 30 20 10 5 3]; % 40+30+20+10+5+3 neurons

net = feedforwardnet(netconf);

% Train the network
net = trainbr(net, inputs', outputs'); % transpose to make them 4x70 and 2x70 for correct orientation

% Predict using the first row of the MEDIAN matrix
input_sample = MEAN(1, :); % Get the first row of the MEDIAN matrix (1x4)
true_out = AB(1, :);
pred = net(input_sample');

% Display the predicted output
disp('Predicted vs True:');
disp(pred');
disp(true_out');

% Save the trained network to a .mat file
save('networkMeanOF.mat', 'net');