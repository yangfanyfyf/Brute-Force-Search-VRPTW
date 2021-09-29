function [cost,NV,TD]=CostFun(VC,dist)
  NV = size(VC,1); % number of vehicle
  TD = TravelDistance(VC,dist); %total travel distance 
  cost = 2000*NV + TD; 
end