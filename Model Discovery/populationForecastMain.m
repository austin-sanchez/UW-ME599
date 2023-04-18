%% ME 599 - MODEL DISCOVERY PROBLEM SET

% Clear command window
close all; clear all; clc;

% Load data in to workspace
load("populationHistory.mat");

% Run Exact DMD and plot forecast
[W1, Lambda1, Phi1, b1, A1, X_forecast1] = populationForecastExactDMD(X,1);
plotPopulationForecast(X,X_forecast1,1)

% Run time-delay DMD with 3-step delay
[W2, Lambda2, Phi2, b2, A2, X_forecast2] = populationForecastExactDMD(X,3);
plotPopulationForecast(X,X_forecast2,3)
