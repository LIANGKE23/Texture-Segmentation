function [GauValue] = Gaussian2(y, S_control)

GauValue = 1/(S_control)*exp(-( y^2)/2/(S_control^2));