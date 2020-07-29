function [GauValue] = Gaussian1(x, S_control)

GauValue = 1/(2*pi*S_control)*exp(-(x^2)/2/(S_control^2));