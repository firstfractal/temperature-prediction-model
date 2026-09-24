%% HDD4060: Final Project - Temperature Prediction & Verification
% Student Number: 003297027 | Station: 102000 (Lappeenranta Airport)

clear; clc; close all;

% --- 1. Load the Data Files ---
% Ensure these filenames match exactly what is in your MATLAB folder
train_file = 'lpr_weather.xlsx'; 
test_file = 'data1a.xlsx';

% 'preserve' ensures MATLAB doesn't rename columns like "Average temperature [°C]"
data_hist = readtable(train_file, 'VariableNamingRule', 'preserve');
data_april = readtable(test_file, 'VariableNamingRule', 'preserve');

% --- 2. Pre-process Training Data (2014 - March 2024) ---
temp_train = data_hist.("Average temperature [°C]");
dates_train = datetime(data_hist.Year, data_hist.Month, data_hist.Day);
t_train = (0:length(temp_train)-1)'; % Timeline in days

% Handle missing data using linear interpolation
temp_train = fillmissing(temp_train, 'linear');

% --- 3. Build and Fit the Mathematical Model ---
% Frequency for a 365.25 day seasonal cycle (Earth's orbit)
w = 2 * pi / 365.25; 

% Construct the Design Matrix (A) for Fourier + 2nd Degree Polynomial
% Theory: T = a0 + a1*cos(wt) + b1*sin(wt) + p1*t + p2*t^2
A_train = [ones(size(t_train)), cos(w*t_train), sin(w*t_train), t_train, t_train.^2];

% Solve for coefficients using the backslash operator (Linear Least Squares)
% This finds the best beta = [a0; a1; b1; p1; p2]
beta = A_train \ temp_train;

% --- 4. Prediction and Verification (April 2024) ---
temp_actual = data_april.("Average temperature [°C]");
dates_april = datetime(data_april.Year, data_april.Month, data_april.Day);

% Create timeline for the 30 days of April starting after the training data
t_april = (max(t_train) + 1 : max(t_train) + length(temp_actual))';
A_april = [ones(size(t_april)), cos(w*t_april), sin(w*t_april), t_april, t_april.^2];

% Generate the "Virtual April" predictions
predictions = A_april * beta;

% Calculate the Mean Square Error (MSE)
mse_val = mean((temp_actual - predictions).^2);

% --- 5. Display Results ---
fprintf('--- Project Results for Student 003297027 ---\n');
fprintf('Mean Square Error (MSE): %.4f\n', mse_val);
fprintf('Model Coefficients:\n');
disp(beta);

% --- 6. Visualization ---
figure('Units', 'normalized', 'Position', [0.1 0.1 0.8 0.4]);

% Subplot 1: The 10-Year Trend
subplot(1,2,1);
plot(dates_train, temp_train, 'Color', [0.8 0.8 0.8], 'DisplayName', 'Historical'); hold on;
plot(dates_train, A_train * beta, 'r', 'LineWidth', 1.5, 'DisplayName', 'Model Fit');
title('10-Year Climatological Fit');
ylabel('Temp (°C)'); grid on; legend('Location', 'south');

% Subplot 2: The April 2024 Comparison (Verification)
subplot(1,2,2);
plot(dates_april, predictions, 'r-o', 'LineWidth', 1.5, 'DisplayName', 'Model'); hold on;
plot(dates_april, temp_actual, 'b-x', 'LineWidth', 1.5, 'DisplayName', 'Actual');
title(['April 2024 Verification (MSE: ', num2str(mse_val, '%.2f'), ')']);
ylabel('Temp (°C)'); grid on; legend;