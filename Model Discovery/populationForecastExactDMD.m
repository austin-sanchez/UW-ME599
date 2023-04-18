function [W, Lambda, Phi, b, A, X_forecast] = populationForecastExactDMD(X, time_delay_steps)

% Step 1: Load data and compute SVD
X_data = X(:,1:end-time_delay_steps);
X_prime = X(:,2:end-(time_delay_steps-1));
for i = 2:time_delay_steps
   X_data = [X_data; X(:,i:end-(time_delay_steps-i+1))];
   X_prime = [X_prime; X(:,(i+1):end-(time_delay_steps-i))];
end 
[U, S, V] = svd(X_data, 'econ');

% Step 2: Compute reduced best fit linear operator with leading 'r' eigenvalues
A_tilde = U' * X_prime * V / S;

% Step 3: Obtain spectral decomposition of A_approx
[W, Lambda] = eig(A_tilde);

% Step 4: Construct high-dimensional DMD mode matrix
Phi = X_prime * ( V / S) * W;

% Step 5: Compute mode amplitudes 
x_1_approx = S * V(1,:)';
b = (W * Lambda) \ x_1_approx;

% Step 6: Compute the best fit operator based on Eq. 7.17
A = Phi * Lambda / Phi;

%% Future state prediction
k_max = length(X_data);
X_forecast = zeros(2*time_delay_steps,k_max);
X_forecast(:,1) = X_prime(:,k_max);
for k = 1:(k_max-1)
    X_forecast(:,k+1) = real(A * X_forecast(:,k));
end

end
