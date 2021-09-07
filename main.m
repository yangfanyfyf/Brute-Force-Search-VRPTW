% 暴力求解
clc;clear;close all;
test_data = importdata('my_test_data_10.xlsx');
depot_time_window1 = TimeTrans(test_data(1,4)); % time window of depot
depot_time_window2 = TimeTrans(test_data(1,5));
vertexs = test_data(:,2:3); 
customer = vertexs(2:end,:); % customer locations
customer_number = size(customer,1);
% vehicle_number = 25;
time_window1 = TimeTrans(test_data(2:end,4));
time_window2 = TimeTrans(test_data(2:end,5));
width = time_window2 - time_window1; % width of time window
service_time = TimeTrans(test_data(2:end,6)+8); 
h = pdist(vertexs);
dist = squareform(h); % distance matrix

destination = test_data(2:end, 7);

% count_desti = sum(destination == -2);
% count_start = size(destination,1) - sum(destination == -1) - count_desti;
% adjust_table = count_start - count_desti;
% 嵌套30层循环？
tic

n_permutation = perms([1:10]);
min_dist = 100000;
best_route = [];
for i = 1 : size(n_permutation, 1)
    route = n_permutation(i,:);
    for j = 1 : size(route,2)
        if (destination(j) ~= -1)
            route = [route(1:j), destination(j), route(j+1 : end)];
        end
    end
    [VC,NV,TD]=decode(route ,time_window1,time_window2,depot_time_window2,service_time,dist);
    disp(['route: ', num2str(i)]);
    if TD < min_dist
        min_dist = TD;
        best_route = route;
    end
end
%[flag, bsv] = Check(bestVC,time_window1,time_window2,depot_time_window2,service_time,dist);
toc