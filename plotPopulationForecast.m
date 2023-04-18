function plotPopulationForecast(X, X_forecast, time_delay_steps)

% Create time arrays
time_data = 1845:2:(1845 + (2 * (length(X) - 1)));
time_forecast = 1903:2:(1903 + (2 * (length(X_forecast) - 1)));

% Plot the original dataset and the forecasted data
figure()
plot(time_data, X(1,:),'-b','LineWidth',1.5)
hold on;
plot(time_data, X(2,:),'-g','LineWidth',1.5)
hold on;
plot(time_forecast, X_forecast(length(X_forecast(:,1))-1,:),'--b','LineWidth',1.5)
hold on;
plot(time_forecast, X_forecast(length(X_forecast(:,1)),:),'--g','LineWidth',1.5)
hold on;
if (time_delay_steps == 1)
    title('Forecast of Canadian lynx and snowshoe hare populations using Exact DMD method')
else 
    title("Forecast of Canadian lynx and snowshoe hare populations using " + time_delay_steps + "-step Time Delay DMD method")
end
legend('Snowshoe hare population','Canadian lynx population','DMD forecast of snowshoe hare population','DMD forecast of Canadian lynx population')
xlabel('Year')
ylabel('Population [thousands]')

end