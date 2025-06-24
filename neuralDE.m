%% Get data
clear all
close all

% Simulate the network to get the users' Sinr
usr = 4*10;
t1 = tic;
results = simulate(@(params)scenarios.mod3.HetNetDE(params, 0.6, 0.7, usr), parameters.setting.SimulationType.local);
time_GPF = toc(t1);

% Create the input velues to the Neural Network
meanValue = mean(results.widebandSinrdB);
maxValue = max(results.widebandSinrdB);
minValue = min(results.widebandSinrdB);
data = [usr;meanValue.';maxValue.';minValue.'];

%% Network

% Define the path to the subfolder and the model file
folder_path = 'neural';       % Name of the subfolder
model_file = 'networkMeanOF.mat';  % Name of the model file

% Load the model from the subfolder
load(fullfile(folder_path, model_file), 'net');

% Predic the Alpha and Beta values for the GPF Scheduler
t2 = tic;
pred = net(data)

% Clip the pred data to the range [0, 1]
pred = max(0, min(1, pred))
time_NN = toc(t2);

results1 = simulate(@(params)scenarios.mod3.HetNetDE(params, pred(1), pred(2), usr), parameters.setting.SimulationType.local);
% Compute uFitness for each result
uFitness = mean(mean(results1.userThroughputMBitPerSec.DL, 2, 'omitnan'));
    
% Compute Jain's Fairness Index for each result
jainFairness = tools.jainFairness(results1);